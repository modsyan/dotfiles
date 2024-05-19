return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      -- position = "right",
      width = 40,
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(arg)
          vim.cmd([[
              setlocal relativenumber
            ]])
        end,
      },
    },
  },
}
