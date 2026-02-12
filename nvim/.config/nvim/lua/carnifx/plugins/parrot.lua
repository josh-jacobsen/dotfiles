return {
  'frankroeder/parrot.nvim',
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require('parrot').setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        anthropic = {
          name = 'anthropic',
          api_key = os.getenv 'ANTHROPIC_API_KEY',
          endpoint = 'https://api.anthropic.com/v1/messages',
          model = 'claude-opus-4-20250805',
        },
      },
    }
  end,
}
