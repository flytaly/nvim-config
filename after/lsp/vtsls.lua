return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"svelte",
		"vue",
	},
	settings = {
		vtsls = {
			tsserver = {
				-- https://github.com/yioneko/vtsls/issues/148 and
				-- https://github.com/mason-org/mason-registry/issues/5064#issuecomment-2016431978
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.expand(
							"$MASON/packages/vue-language-server/node_modules/@vue/language-server"
						),
						languages = { "vue" },
						configNamespace = "typescript",
						enableForWorkspaceTypeScriptVersions = true,
					},
				},
			},
		},
	},
}
