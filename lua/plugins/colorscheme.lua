return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },

	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			transparent = true,
			style = "moon",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
