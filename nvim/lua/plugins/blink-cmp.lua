return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = false, -- Don't show automatically
      },
    },
    keymap = {
      preset = "default",
      ["<CR>"] = {}, -- Enter does nothing in completion
      ["<C-Space>"] = { "show", "fallback" }, -- Manually trigger
      ["<C-Enter>"] = { "accept", "fallback" }, -- Accept
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
  },
}
