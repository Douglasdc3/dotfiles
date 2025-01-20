return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>' },
    { '<Leader>tf', ':TestFile<CR>' },
    { '<Leader>ts', ':TestSuite<CR>' },
    { '<Leader>tl', ':TestLast<CR>' },
    { '<Leader>tv', ':TestVisit<CR>' },
  },
  dependencies = {
    'voldikss/vim-floaterm',
    'preservim/vimux'
  },
  config = function()
    vim.cmd([[
      function! PhpUnitTransform(cmd) abort
        return join(map(split(a:cmd), 'v:val == "--colors" ? "--colors=always" : v:val'))
      endfunction

      let g:test#custom_transformations = {'phpunit': function('PhpUnitTransform')}
      let g:test#transformation = 'phpunit'
      " let test#php#phpunit#options = '--colors=always'

      let test#php#pest#options = '-v'
      let test#javascript#jest#options = '--color'

      let g:test#strategy = 'vimux'
    ]])
  end
}

