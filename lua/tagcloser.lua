local M = {}

vim.api.nvim_set_keymap('i', '>>', '<cmd>lua require("tagcloser").autoclose_tag()<CR>', {expr = true, noremap = true})

function M.autoclose_tag()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  local tag = line:sub(1, col):match('<(%w+)[^<]*$')

  if tag then
    local left = vim.api.nvim_replace_termcodes('<Left>', true, true, true)
    return '>' .. '</' .. tag .. '>' .. string.rep(left, #tag + 3)
  else
    return '>'
  end
end

return M


