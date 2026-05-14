-- ftplugin/java.lua — loaded automatically by Neovim for every Java buffer.
--
-- <leader>lf:  If the current file lives inside a Maven project, run
--              `mvn spotless:apply -DspotlessFiles=<file>` via toggleterm.
--              Otherwise fall back to vim.lsp.buf.format() (non-Maven projects).
--
-- This file is always sourced; no exrc/trust needed.

local augroup = vim.api.nvim_create_augroup("JavaSpotlessFormat", { clear = false })

--- Walk up from dir to find the nearest directory containing pom.xml.
local function find_maven_root(dir)
  local d = dir
  while true do
    if vim.fn.filereadable(d .. "/pom.xml") == 1 then
      return d
    end
    local parent = vim.fn.fnamemodify(d, ":h")
    if parent == d then return nil end
    d = parent
  end
end

--- Return mvnw path if found walking upward, else "mvn".
local function maven_exe(start_dir)
  local found = vim.fn.findfile("mvnw", start_dir .. ";")
  if found ~= "" then return vim.fn.fnamemodify(found, ":p") end
  return "mvn"
end

--- Escape string as a Java regex literal (for -DspotlessFiles).
local function java_regex_escape(s)
  return s:gsub("([%.%+%*%?%[%]%^%$%(%)%{%}%|%\\])", "\\%1")
end

local function spotless_or_lsp_format()
  local filepath = vim.fn.expand("%:p")
  if filepath == "" then
    vim.notify("[Format] No file in buffer", vim.log.levels.WARN)
    return
  end

  local maven_root = find_maven_root(vim.fn.fnamemodify(filepath, ":h"))

  if not maven_root then
    -- Not a Maven project — fall back to LSP format.
    vim.lsp.buf.format()
    return
  end

  local mvn = maven_exe(maven_root)
  local file_regex = java_regex_escape(filepath)
  local cmd = string.format(
    "cd %s && %s spotless:apply -DspotlessFiles=%s",
    vim.fn.shellescape(maven_root),
    mvn,
    vim.fn.shellescape(file_regex)
  )

  local ok, toggleterm = pcall(require, "toggleterm.terminal")
  if not ok then
    vim.notify("[Spotless] toggleterm not available, running blocking…", vim.log.levels.WARN)
    vim.cmd("!" .. cmd)
    return
  end

  local filename = vim.fn.expand("%:t")
  vim.notify("[Spotless] Formatting " .. filename .. " …", vim.log.levels.INFO)

  toggleterm.Terminal:new({
    cmd = cmd,
    direction = "float",
    close_on_exit = false,
    float_opts = {
      border = "rounded",
      width = math.floor(vim.o.columns * 0.80),
      height = math.floor(vim.o.lines * 0.60),
    },
    on_exit = function(_, _, exit_code, _)
      vim.schedule(function()
        if exit_code == 0 then
          vim.notify("[Spotless] Done ✓  " .. filename, vim.log.levels.INFO)
          vim.cmd("checktime")
        else
          vim.notify(
            "[Spotless] FAILED (exit " .. tostring(exit_code) .. ") — see terminal",
            vim.log.levels.ERROR
          )
        end
      end)
    end,
  }):toggle()
end

-- Set buffer-local <leader>lf immediately (beats the global nvim-lspconfig key).
vim.keymap.set("n", "<leader>lf", spotless_or_lsp_format, {
  buffer = true,
  desc = "Format: Spotless (Maven) or LSP fallback",
  silent = true,
})

-- Re-assert the keymap + strip LSP format capabilities every time an LSP
-- client attaches to THIS buffer.  jdtls fires LspAttach after ftplugin,
-- which would otherwise overwrite the keymap if it re-registers one.
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  buffer = 0,  -- current buffer only
  callback = function(ev)
    -- Strip format capability so conform/lsp_fallback and format-on-save
    -- can never call jdtls format on this buffer.
    if find_maven_root(vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")) then
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    end

    -- Re-assert our keymap (in case LspAttach registered something global).
    vim.keymap.set("n", "<leader>lf", spotless_or_lsp_format, {
      buffer = ev.buf,
      desc = "Format: Spotless (Maven) or LSP fallback",
      silent = true,
    })
  end,
})
