return {
  priority = 60,

  condition = {
    callback = function()
      local exists = vim.fn.filereadable(".idea/Makefile") == 1
      print("[idea_make] Makefile exists = " .. tostring(exists))
      return exists
    end,
  },

  generator = function(_, cb)
    -- Call the built-in make template but override the working directory
    require("overseer.template.make").generator({ dir = vim.fn.fnamemodify(".idea", ":p") }, function(tasks)
      for _, task in ipairs(tasks) do
        task.name = "[.idea] " .. task.name -- Optional: prefix names for clarity
      end
      cb(tasks)
    end)
  end,
}
