-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Override with local paths in user.local.lua (gitignored)

---@type LazySpec
return {
	{
		"nhomble/moon-monorepo.nvim",
		config = function()
			require("neo-tree.sources.moon-monorepo").setup({
				icons = {
					tags_header = "",
					projects_header = "",
					task = "",
					folder_open = "",
					folder_closed = "",
				},
			})
		end,
		dependencies = {
			"nvim-neo-tree/neo-tree.nvim",
			opts = function(_, opts)
				local moon = require("neo-tree.sources.moon-monorepo")
				table.insert(opts.sources, moon.name)

				if moon.is_supported() then
					table.insert(opts.source_selector.sources, {
						display_name = moon.display_name,
						source = moon.name,
					})
				end
			end,
		},
	},
	{
		"nhomble/thought-flow.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("thought-flow").setup({
				notifications = {
					error = function(msg)
						require("notify")(msg, "error")
					end,
				},
			})
		end,
	},
	{
		"jbyuki/one-small-step-for-vimkind",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"mfussenegger/nvim-dap",
			{
				'microsoft/vscode-js-debug',
				version = '1.x',
				build = 'npm i && npm run compile vsDebugServerBundle && mv dist out',
			},
		},
		config = function()
			require("dap-vscode-js").setup({
				-- debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug",
        debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
				-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
				-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
				-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
				-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
				-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
			})

			for _, language in ipairs({ "typescript", "javascript" }) do
				require("dap").configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
				}
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
			end
		end,
	},
	{
		-- https://github.com/AstroNvim/astrocommunity/blob/main/lua/astrocommunity/pack/typescript/init.lua#L185
		"nhomble/package-info.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
		event = "BufRead package.json",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			{ url = "https://github.com/nhomble/neotest-vitest", branch = "main" },
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest")({
						-- https://github.com/vitest-dev/vscode/commit/d4d4f70ac97657948daad4af0d4e119cf5220d0d
						vitestCommand = "npx vitest",
					}),
				},
			})
		end,
	},

	-- == Examples of Adding Plugins ==

	"andweeb/presence.nvim",
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},

	-- == Examples of Overriding Plugins ==

	-- customize dashboard with snacks.nvim (replaces alpha-nvim in v5)
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
				preset = {
					header = [[
                                                     
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                     ]],
				},
			},
		},
	},

	-- You can disable default plugins as follows:
	{ "max397574/better-escape.nvim", enabled = true },

	-- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
					-- don't add a pair if the next character is %
							:with_pair(cond.not_after_regex("%%"))
					-- don't add a pair if  the previous character is xxx
							:with_pair(
								cond.not_before_regex("xxx", 3)
							)
					-- don't move right when repeat character
							:with_move(cond.none())
					-- don't delete if the next character is xx
							:with_del(cond.not_after_regex("xx"))
					-- disable adding a newline when you press <cr>
							:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},
}
