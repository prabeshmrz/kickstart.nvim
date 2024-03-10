-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
vim.cmd [[ nnoremap <A-1> :Neotree toggle<cr> ]]
vim.cmd [[ nnoremap <A-2> :Neotree toggle buffers<cr> ]]
vim.cmd [[ nnoremap <A-3> :Neotree toggle git_status<cr> ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      source_selector = {
        winbar = false,
        statusline = true,
      },
      window = {
        mappings = {
          ['l'] = { 'open' },
          ['h'] = { 'close_node' },
          ['C'] = { 'close_all_nodes' },
        },
      },
    }
  end,
}
