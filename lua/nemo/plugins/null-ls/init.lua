G.on_require("null-ls", function(null_ls)
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--indent-type", "Spaces",
          "--indent-width", "2",
          "--quote-style", "AutoPreferDouble",
          "--column-width", "79",
          "--call-parentheses", "None",
        }
      }),
      -- null_ls.builtins.diagnostics.selene,
			null_ls.builtins.formatting.google_java_format.with({
				generator_opts = {
					command = "/home/nemo/Sources/node-v18.4.0-linux-x64/bin/node_modules/google-java-format/index.js",
					args = {
           "-"
					},
					to_stdin = true,
				},
			}),
		},
	})
end)
