-- In ~/.config/nvim/lua/plugins/wallust.lua
return {
  -- Disable other colorschemes
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "wallust", -- Set as string, not function
    },
  },

  -- Make sure wallust colorscheme is available before LazyVim tries to load it
  {
    dir = vim.fn.stdpath("config"),
    name = "wallust-colorscheme",
    config = function()
      -- Register the colorscheme so it can be found by name
      local wallust_path = vim.fn.stdpath("config") .. "/lua/colors/wallust.lua"
      if vim.fn.filereadable(wallust_path) == 1 then
        -- Create a proper colorscheme file that vim can find
        local colors_dir = vim.fn.stdpath("config") .. "/colors"
        vim.fn.mkdir(colors_dir, "p")

        local colorscheme_content = [[
" Wallust colorscheme loader
lua require('colors.wallust').setup()
]]

        local colorscheme_file = colors_dir .. "/wallust.vim"
        local file = io.open(colorscheme_file, "w")
        if file then
          file:write(colorscheme_content)
          file:close()
        end
      end

      -- Add reload commands
      vim.api.nvim_create_user_command("WallustReload", function()
        package.loaded["colors.wallust"] = nil
        require("colors.wallust").setup()
        vim.notify("Wallust reloaded!")
      end, {})

      vim.keymap.set("n", "<leader>uw", "<cmd>WallustReload<cr>", { desc = "Reload Wallust" })
    end,
    priority = 1000,
  },
}
