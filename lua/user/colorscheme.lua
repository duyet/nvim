vim.cmd([[
try
  " colorscheme darkplus
  " colorscheme nightfox
  " colorscheme kanagawa
  " colorscheme tokyonight-storm
  " colorscheme tokyonight-day
  colorscheme tokyonight-moon
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
