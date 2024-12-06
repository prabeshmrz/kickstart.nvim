return {
  'nvim-java/nvim-java',
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      handlers = {
        ['jdtls'] = function()
          require('java').setup {}
          require('lspconfig').jdtls.setup {}
        end,
      },
    },
  },
}
