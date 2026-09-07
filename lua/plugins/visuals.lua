-- luacheck: globals vim Snacks
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				float = {
					transparent = false,
					solid = false,
				},
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false,
				no_bold = false,
				no_underline = false,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					keywords = { "italic" },
					types = { "italic" },
				},
				lsp_styles = {
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
						ok = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
				color_overrides = {
					mocha = {
						mauve = "#D2B5F8",
						sky = "#A9D8ED",
						green = "#CCEAC3",
						teal = "#A1EDE3",
					},
				},
				custom_highlights = function(colors)
					return {
						["@constructor"] = { fg = colors.lavender },
						["@module"] = { bold = true, fg = colors.pink },
						["@variable.parameter.haskell"] = { fg = colors.text },
						["@function.builtin"] = { fg = colors.mauve },
						["@variable.builtin"] = { fg = colors.rosewater },
						["@constant.builtin"] = { fg = colors.mauve },
						["@constant.typst"] = { fg = colors.pink },
						["@markup.italic"] = { fg = colors.rosewater },
						["@markup.heading.1"] = { fg = colors.pink, style = { "bold" } },
						["@markup.heading.2"] = { fg = colors.blue, style = { "bold" } },
						["@markup.heading.3"] = { fg = colors.mauve, style = { "bold" } },
						["@variable.parameter"] = { fg = colors.flamingo },
						["Type"] = { fg = colors.pink },
						["Constant"] = { fg = colors.flamingo },
						["Character"] = { fg = colors.teal },
						["Number"] = { fg = colors.green },
						["Boolean"] = { fg = colors.green },
					}
				end,
				default_integrations = true,
				auto_integrations = false,
				integrations = {
					aerial = true,
					alpha = true,
					cmp = true,
					dashboard = true,
					flash = true,
					fzf = true,
					grug_far = true,
					gitsigns = true,
					headlines = true,
					illuminate = true,
					indent_blankline = { enabled = true },
					leap = true,
					lsp_trouble = true,
					mason = true,
					mini = true,
					navic = { enabled = true, custom_bg = "lualine" },
					neotest = true,
					neotree = true,
					noice = true,
					notify = true,
					snacks = true,
					telescope = true,
					treesitter_context = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16,
						events = {
							"WinEnter",
							"BufEnter",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						"diagnostics",
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = { left = 1, right = 0 },
						},
						"filename",
					},
					lualine_x = {
						Snacks.profiler.status(),
						-- stylua: ignore
						{
						  function() return require("noice").api.status.command.get() end,
						  cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
						  color = function() return { fg = Snacks.util.color("Statement") } end,
						},
						-- stylua: ignore
						{
						  function() return require("noice").api.status.mode.get() end,
						  cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
						  color = function() return { fg = Snacks.util.color("Constant") } end,
						},
						"diff",
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
		"hiphish/rainbow-delimiters.nvim",
		lazy = false,
		config = function()
			require("rainbow-delimiters.setup").setup({
				strategy = {
					[""] = "rainbow-delimiters.strategy.global",
					vim = "rainbow-delimiters.strategy.local",
				},
				query = {
					[""] = "rainbow-delimiters",
				},
				highlight = {
					"@punctuation.bracket",
					"@variable",
				},
				blacklist = { "html" },
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				override = {
					zsh = {
						icon = "",
						color = "#428850",
						cterm_color = "65",
						name = "Zsh",
					},
				},
				color_icons = true,
				default = true,
				strict = true,
				variant = "light|dark",
				blend = 0,
				override_by_extension = {
					["js"] = {
						icon = "",
						color = "#fab387",
						name = "JS",
					},
					["json"] = {
						icon = "",
						color = "#f9e2af",
						name = "JSON",
					},
					["ts"] = {
						icon = "",
						color = "#89b4fa",
						name = "TS",
					},
					["css"] = {
						icon = "",
						color = "#cba6f7",
						name = "CSS",
					},
					["hs"] = {
						icon = "",
						color = "#b4befe",
						name = "Haskell",
					},
				},
				override_by_operating_system = {
					["apple"] = {
						icon = "",
						color = "#A2AAAD",
						cterm_color = "248",
						name = "Apple",
					},
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				blame_formatter = nil,
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
    -- stylua: ignore
    keys = {
      { "<leader>sn", "", desc = "+noice"},
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4)
            then return "<c-f>"
          end
        end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4)
            then return "<c-b>"
          end
        end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
		config = function(_, opts)
			if vim.o.filetype == "lazy" then
				vim.cmd([[messages clear]])
			end
			require("noice").setup(opts)
		end,
	},
}
