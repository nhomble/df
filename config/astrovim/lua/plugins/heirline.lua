return {
	"rebelot/heirline.nvim",
	opts = function(_, opts)
		local status = require("astroui.status")

		-- Define the thought-flow component
		opts.statusline[#opts.statusline + 1] = status.component.builder({
			provider = function()
				local stats = require("thought-flow").statistics()
				local count = stats.global_count
				return count > 0 and ("▪ " .. count) or ""
			end,
			hl = { fg = "gray" },
			on_click = {
				callback = function()
					vim.cmd("ThoughtFlowReview")
				end,
				name = "thought_flow_click",
			},
		})

		return opts
	end,
}
