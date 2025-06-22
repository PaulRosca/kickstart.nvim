-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Remap window keymaps
vim.keymap.set('n', '<leader>w', '<C-w>')

vim.keymap.set('n', '<leader>sP', ':e ~/.config/nvim/<cr>', { desc = 'Open private config' })

return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':G<cr>', { desc = '[G]it [S]tatus' })
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
      }
      vim.keymap.set('n', '<leader>te', ':ToggleTerm<cr>', { desc = '[T]oggle Terminal [E]mulator' })
    end,
  },
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local ts = require 'telescope'
      ts.load_extension 'project'
      vim.keymap.set('n', '<leader>sp', ts.extensions.project.project, { desc = '[S]earch [P]projects' })
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension 'file_browser'
      vim.keymap.set('n', '<leader>sb', ':Telescope file_browser path=%:p:h select_buffer=true<cr>', { desc = '[S]earch [B]rowser' })
    end,
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
            '',
            '',
            ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
            ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
            ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
            ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
            ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
            ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
            '',
            ' [ TIP: To exit Neovim, just power off your computer. ] ',
            '',
          },
          center = {
            {
              icon = '  ',
              desc = 'Search recent files                       ',
              action = 'Telescope oldfiles',
              key = 'SPC s .',
            },
            {
              icon = '  ',
              desc = 'Search files                              ',
              action = 'Telescope find_files find_command=rg,--files',
              key = 'SPC s f',
            },
            {
              icon = '  ',
              desc = 'File browser                            ',
              action = 'Telescope file_browser',
              key = 'SPC s b',
            },
            {
              icon = '🚀 ',
              desc = 'Search project                              ',
              action = 'Telescope projects',
              key = 'SPC s p',
            },
            {
              icon = '  ',
              desc = 'Search grep                               ',
              action = 'Telescope live_grep',
              key = 'SPC s g',
            },
            {
              icon = '⚙  ',
              desc = 'Open private config',
              action = 'e ~/.config/nvim/init.lua<cr>         ',
              key = 'SPC s P',
            },
            {
              icon = '  ',
              desc = 'Load new theme                          ',
              action = 'Telescope colorscheme',
              key = 'SPC h t',
            },
          },
          footer = { '', "🎉 I don't always test my code, but when I do, I do it in production." },
        },
      }
    end,
  },
}
