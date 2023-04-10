return {
	{ "williamboman/mason.nvim", opts = { PATH = "append" } },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"cssls",
				"gopls",
				"html",
				"intelephense",
				"marksman",
				"jsonls",
				"pyright",
				"lua_ls",
				"taplo",
				"texlab",
				"tsserver",
				"yamlls",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"shellcheck",
				"stylua",
				"black",
				"isort",
				"prettierd",
				"shfmt",
				"shellcheck",
			},
			handlers = {
				taplo = function() end, -- disable taplo in null-ls, it's taken care of by lspconfig
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = {
				"bash",
				"cppdbg",
				"delve",
				"js",
				"php",
				"python",
			},
		},
	},
	-- colorschemes
	{
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({})
		end,
	},
	{
		"sainnhe/sonokai",
		init = function() -- init function runs before the plugin is loaded
			vim.g.sonokai_style = "shusia"
		end,
	},
}
