return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/Obsidian/personal',
      },
      {
        name = 'work',
        path = '~/Documents/Obsidian/work',
      },
      {
        name = 'blog',
        path = '~/File Drive/LUCIFER/PERSONAL/projects/mysite/nextjs-prabeshmaharjan.com.np/prabeshmaharjan.com.np/content/posts/',
        overrides = {
          attachments = {
            img_folder = '~/File Drive/LUCIFER/PERSONAL/projects/mysite/nextjs-prabeshmaharjan.com.np/prabeshmaharjan.com.np/public',
          },
        },
      },
    },

    -- see below for full list of options 👇
  },
}
