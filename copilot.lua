-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }
-- vim.g.copilot_filetypes = { ["*"] = false, python = true }

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<M-y>", "copilot#Accept('')", { expr = true, silent = true, replace_keycodes = false })

-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)

vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
