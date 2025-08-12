-- LazyVim plugin configuration for Wallust colorscheme
-- Save this as ~/.config/nvim/lua/plugins/wallust.lua

return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "wallust",
		},
	},
	{
		-- Create a dummy plugin entry to ensure our colorscheme loads
		dir = vim.fn.stdpath("config"),
		name = "wallust-colorscheme",
		config = function()
			-- Load the wallust colorscheme if it exists
			local ok, wallust = pcall(require, "colors.wallust")
			if ok then
				wallust.setup()
			else
				-- Fallback to base16 if wallust template hasn't been generated yet
				vim.cmd("colorscheme base16-default-dark")
				vim.notify(
					"Wallust colorscheme not found, using base16 fallback. Run wallust to generate colors.",
					vim.log.levels.WARN
				)
			end
		end,
		priority = 1000,
	},
	{
		-- Optional: Add a command to reload colors
		dir = vim.fn.stdpath("config"),
		name = "wallust-commands",
		config = function()
			-- Command to reload wallust colors
			vim.api.nvim_create_user_command("WallustReload", function()
				-- Clear highlight cache
				vim.cmd("highlight clear")

				-- Reload the colorscheme module
				package.loaded["colors.wallust"] = nil

				local ok, wallust = pcall(require, "colors.wallust")
				if ok then
					wallust.setup()
					vim.notify("Wallust colors reloaded!", vim.log.levels.INFO)
				else
					vim.notify("Failed to reload wallust colors", vim.log.levels.ERROR)
				end
			end, { desc = "Reload Wallust colorscheme" })

			-- Keymap to reload colors quickly
			vim.keymap.set("n", "<leader>uw", "<cmd>WallustReload<cr>", { desc = "Reload Wallust colors" })

			-- Auto-reload when gaining focus (optional)
			local wallust_group = vim.api.nvim_create_augroup("WallustReload", { clear = true })
			vim.api.nvim_create_autocmd("FocusGained", {
				group = wallust_group,
				callback = function()
					-- Only reload if wallust colorscheme is active
					if vim.g.colors_name == "wallust" then
						vim.cmd("WallustReload")
					end
				end,
				desc = "Auto-reload wallust colors on focus",
			})
		end,
	},
}
