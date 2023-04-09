local setup, vimgo = pcall(require, "vim-go")
if not setup then return end

vim.cmd([[
  au filetype go inoremap <buffer> . .<C-x><C-o>
]])

vimgo.setup({
  go_highlight_fields = 1,
  go_highlight_functions = 1,
  go_highlight_function_calls = 1,
  go_highlight_extra_types = 1,
  go_highlight_operators = 1,
  go_fmt_autosave = 1,
  go_fmt_command = "goimports",
  go_auto_type_info = 1
})
