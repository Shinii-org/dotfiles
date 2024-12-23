return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    options = {
      close_command = "bdelete",
      right_mouse_command = "bdelete",      
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = {
          Error = " ",
          Warn = " ",
          Hint = "󰠠 ",
          Info = " ",
        }
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      get_element_icon = function(opts)
        local icons = {
          lua = "",
          python = "",
          javascript = "",
          typescript = "",
        }
        return icons[opts.filetype] or "" 
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(function()
            require("bufferline.state").set_offset(0)
          end)
        end)
      end,
    })
  end,
}

