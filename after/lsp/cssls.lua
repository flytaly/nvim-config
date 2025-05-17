return {
	-- https://github.com/tailwindlabs/tailwindcss/discussions/5258
	-- disable tailwindcss @apply warning
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
		scss = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
}
