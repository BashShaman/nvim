G.on_require("telescope", function (telescope)
  local state = require('telescope.actions.state')
  local layout = require('telescope.actions.layout')

  telescope.setup {
    defaults = {
      prompt_prefix = '$ ',
      mappings = {
        i = {
          ['<C-a>'] = (function()
            return function()
              print(vim.inspect(state.get_selected_entry()))
            end
          end)(),
        }
      }
    },
    pickers = {
      find_files = {
        theme = 'dropdown',
        previewer = false,
        -- winblend=10,
      }
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown {
        }
      }
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  telescope.load_extension('fzf')
  telescope.load_extension('ui-select')
end)

