vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_enabled = 0
return {
  {
    'lervag/vimtex',
    init = function() end,
  },
  {
    'kdheepak/cmp-latex-symbols',
  },
  {
    'KeitaNakamura/tex-conceal.vim',
  },
}
