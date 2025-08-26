require("neo-tree").setup({
    window = {
      width = 35, -- Устанавливаем фиксированную ширину
      auto_expand_width = false, -- Отключаем автоматическое расширение
      mappings = {
        ["<C-w>"] = "noop", -- Отключаем возможность закрытия всех окон
      }
    }
  })
  