return {
  'folke/which-key.nvim',
  opts = {},
  config = function()
    -- document existing key chains
    require('which-key').add {
      { '<leader>c', name = '[C]ode', },
      { '<leader>d', name = '[D]ocument', },
      { '<leader>g', name = '[G]it', },
      { '<leader>h', name = 'More git', },
      { '<leader>r', name = '[R]ename', },
      { '<leader>s', name = '[S]earch', },
      { '<leader>w', name = '[W]orkspace', },
    }
  end
}
