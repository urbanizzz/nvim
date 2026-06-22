local M = {}

function M.run()
  local mypy_bin = os.getenv("HOME") .. "/.local/share/pylsp-venv/bin/mypy"
  local file = vim.fn.expand('%')
  local efm = "%f:%l:%c: %t%*[^:]: %m,%f:%l: %t%*[^:]: %m"

  print("Checking types...")

  vim.fn.jobstart({mypy_bin, file}, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      -- Удаляем пустые строки из вывода mypy
      local cleaned_data = {}
      for _, line in ipairs(data) do
        if line ~= "" then
          table.insert(cleaned_data, line)
        end
      end

      if #cleaned_data > 0 then
        vim.fn.setqflist({}, 'r', {
          title = 'Mypy Check',
          lines = cleaned_data,
          efm = efm
        })
        vim.cmd('copen')
      else
        vim.cmd('cclose')
        print("Mypy: Success (no issues found)")
      end
    end,
    on_stderr = function(_, data)
      if data and #data > 1 and data[1] ~= "" then
        print("Mypy Error: " .. table.concat(data, "\n"))
      end
    end
  })
end

return M

