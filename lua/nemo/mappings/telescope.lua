local M = {}

M.apply = function ()
  G.on_require("telescope.builtin", function (telescope)
    local opts = { noremap = true }
    -- <f> stands for find
    vim.keymap.set("n", "<leader>ff", telescope.find_files, opts)
    -- <t> for text
    vim.keymap.set("n", "<leader>ft", telescope.live_grep, opts)
    vim.keymap.set("n", "<leader>fb", telescope.buffers, opts)
    vim.keymap.set("n", "<leader>fh", telescope.help_tags, opts)
    -- <l> for last search
    vim.keymap.set("n", "<leader>fl", telescope.resume, opts)
    -- <r> for recent files
    vim.keymap.set("n", "<leader>fr", telescope.oldfiles, opts)
    -- <R> for registers
    vim.keymap.set("n", "<leader>fR", telescope.registers, opts)
    vim.keymap.set("n", "<leader>fk", telescope.keymaps, opts)
    vim.keymap.set("n", "<leader>fc", telescope.commands, opts)
    vim.keymap.set("n", "<leader>fH", telescope.command_history, opts)
    -- Just for reference
    vim.keymap.set("n", "<leader>/", function ()
      telescope.current_buffer_fuzzy_find({
        sorting_strategy = "ascending",
        prompt_position = "top",
      })
    end, opts)
  end)
end

return M
