return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    -- Default configuration
    size = 15,
    open_mapping = nil, -- We use custom keymaps instead
    direction = 'horizontal', -- Default to horizontal (bottom) for all terminals
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
  },
}
