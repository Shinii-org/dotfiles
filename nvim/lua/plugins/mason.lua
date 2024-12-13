return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint-lsp",
				"prettierd",
				"shfmt",
				"stylua",
				"selene",
				"shellcheck",
				"sql-formatter",
			},
		},
	},
}
