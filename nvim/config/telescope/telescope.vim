" Telescope fuzzy finder configuration.
"
" @author Maciej Bedra

" Key binding used to launch fuzzy finder (file search)
nmap <C-_> <cmd>Telescope find_files<CR>

" Key binding used to launch fuzzy finder (text occurrence)
nmap <C-_><C-_> <cmd>Telescope live_grep<CR>

" Telescope defaults.
lua << EOF
  require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_prefix = "> ",
      selection_caret = "> ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter =  require'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      path_display = {},
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
      disable_devicons = false,
    }
  }
EOF
