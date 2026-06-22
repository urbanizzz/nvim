-- 1. Защита от повторной инициализации буфера
if vim.b.did_python_ide_init then
  return
end
vim.b.did_python_ide_init = true

-- 2. Настройки табуляции (локально для текущего буфера)
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- 3. Клавиатурные маппинги (тоже локально для буфера)
local opts = { buffer = true, noremap = true, silent = true }

-- Go to Definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- Keyword / hover - документация / сигнатура под курсором
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- References - найти все упоминания в проекте
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- ReName - переименовать сущность по всему проекту
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
-- Format - автоисправление стиля кода
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
-- mypy type Checker
vim.keymap.set('n', '<leader>c', function() require('mypy_checker').run() end, opts)
