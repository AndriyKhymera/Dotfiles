-- Normal mode, Non-recursive mapping
-- Helper function for creating keymaps
-- lhs - left-hand side   - the trigger key(s)
-- rhs - right-hand side  - the action
local function nnoremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

return {
      "mfussenegger/nvim-jdtls",
      ft = "java",
      config = function()
        local on_attach = function(client, bufnr)
          require("nvchad.configs.lspconfig").on_attach(client, bufnr)

          local bufopts = { noremap=true, silent=true, buffer=bufnr }
          nnoremap('gD', vim.lsp.buf.declaration, bufopts, "Go to declaration")
          nnoremap('gd', vim.lsp.buf.definition, bufopts, "Go to definition")
          nnoremap("gr", require('telescope.builtin').lsp_references, bufopts, "Get lsp_references")
          nnoremap('K', vim.lsp.buf.hover, bufopts, "Hover text")
          -- nnoremap("<leader>vc", jdtls.test_class, bufopts, "Test class (DAP)")
          -- nnoremap("<leader>vm", jdtls.test_nearest_method, bufopts, "Test method (DAP)")

        end

        -- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        -- calculate workspace dir
        -- local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
        -- get the mason install path
        -- local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        -- get the debug adapter install path
        -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
        local debug_adapater_path = "/Users/andriikhymera/PersonalProject/java-debug/com.microsoft.java.debug.plugin/target"
        local bundles = {
          vim.fn.glob(debug_adapater_path .. "/com.microsoft.java.debug.plugin-*.jar")
        }

        -- Comment out these lines if you have 'java-test' installed
        -- local java_test_path = require("mason-registry").get_package("java-test"):get_install_path()
        -- vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n"))
        local vscode_java_test_path="/Users/andriikhymera/PersonalProject/vscode-java-test/"
        vim.list_extend(bundles, vim.split(vim.fn.glob(vscode_java_test_path .. "server/com.microsoft.java.test.plugin*.jar"), "\n"))
        vim.list_extend(bundles, vim.split(vim.fn.glob(vscode_java_test_path .. "java-extension/com.microsoft.java.test.plugin/target/*.jar"), "\n"))
        vim.list_extend(bundles, vim.split(vim.fn.glob(vscode_java_test_path .. "java-extension/com.microsoft.java.test.runner/target/*.jar"), "\n"))
                                                  -- ~/.dotfiles/.config/nvim/bin/jdtls-with-jdk21.sh
        local jdtls_start_script_path=vim.fn.expand("~/.dotfiles/.config/nvim/bin/jdtls-with-jdk21.sh")
        -- local jdtls_start_script_path=vim.fn.expand("~/.dotfiles/.config/nvim/bin/default.sh")
        local lombok_path = vim.fn.expand("~/.m2/repository/org/projectlombok/lombok/1.18.36/lombok-1.18.36.jar")

        local config = {
          cmd = {
            jdtls_start_script_path,
            "--jvm-arg=-javaagent:" .. lombok_path,
            -- "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            -- "-Dosgi.bundles.defaultStartLevel=4",
            -- "-Declipse.product=org.eclipse.jdt.ls.core.product",
            -- "-Dlog.protocol=true",
            -- "-Dlog.level=ALL",
            -- "-Xms1g",
            -- "--add-modules=ALL-SYSTEM",
            -- "--add-opens",
            -- "java.base/java.util=ALL-UNNAMED",
            -- "--add-opens",
            -- "java.base/java.lang=ALL-UNNAMED",
            -- "-data",
            -- workspace_dir,
          },
          on_attach = on_attach,
          -- capabilities = require("plugins.configs.lspconfig").capabilities,
          root_dir = vim.fs.dirname(
            vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
          ),
          settings = {
            java = {
              signatureHelp = { enabled = true },
            }
          },
          init_options = {
            bundles = bundles
          }
        }

        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          callback = function()
            require("jdtls").start_or_attach(config)
          end,
        })

      end,
}
