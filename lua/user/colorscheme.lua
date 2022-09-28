vim.cmd([[
try
  " colorscheme darkplus
  " colorscheme nightfox
  colorscheme kanagawa
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
