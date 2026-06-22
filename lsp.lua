-- 1. Настраиваем pylsp через новое нативное API Neovim 0.11+
vim.lsp.config('pylsp', {
  cmd = { os.getenv("HOME") .. "/.local/share/pylsp-venv/bin/pylsp" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        mccabe = { enabled = false },
        pyflakes = { enabled = true },
        autopep8 = { enabled = true },
        yapf = { enabled = false }
      }
    }
  }
})

-- Подключаем возможности автодополнения к серверу
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.enable('pylsp', { capabilities = capabilities })

-- Системные настройки отображения ошибок
vim.diagnostic.config({
  virtual_text = true,   -- Оставляем текст в конце строки, раз ты решил его протестировать
  severity_sort = true,  -- Ошибки (Errors) гарантированно будут выше Предупреждений (Warnings)
})

-- Настройка всплывающего меню nvim-cmp
local cmp = require('cmp')
cmp.setup({
  -- Меню появляется автоматически при вводе
  completion = { autocomplete = { cmp.TriggerEvent.TextChanged } },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Enter подтверждает выбор
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item() else fallback() end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- Брать данные из pylsp
  })
})

-- Подсветка одинаковых переменных под курсором средствами LSP
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.lsp.buf.document_highlight()
  end,
})
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  callback = function()
    vim.lsp.buf.clear_references()
  end,
})

-- Устанавливаем таймер отклика в 300 мс (вместо дефолтных 4000 мс)
vim.o.updatetime = 300

-- Настройка внешнего вида подсветки переменных
-- Замени параметры внутри таблицы {} на те, что выбрал:
-- для underline / reverse
-- {cterm = { underline = true}, underline = true} cterm для xterm, второй для gui
-- ctermbg=237/238 guibg=#3a3a3a - background
-- ctermfg=220 guifg=#ffd700 - foreground
local hl_groups = { "LspReferenceText", "LspReferenceRead", "LspReferenceWrite" }
for _, group in ipairs(hl_groups) do
  vim.api.nvim_set_hl(0, group, {
   cterm = { underline = true },
   underline = true
  })
end
