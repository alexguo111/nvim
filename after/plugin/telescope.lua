local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

local tel = require("telescope")
--local actions = require("telescope.actions")
--local action_layout = require("telescope.actions.layout")
local fb_actions = require "telescope".extensions.file_browser.actions

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

-- open file browser
--vim.api.nvim_set_keymap(
--  "n",
--  "<space>fb",
--  ":Telescope file_browser<cr>",
--  { noremap = true }
--)

tel.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
       -- ["<C-s>"] = actions.cycle_previewers_next,
       -- ["<C-a>"] = actions.cycle_previewers_prev,
       -- ["<C-p>"] = action_layout.toggle_preview,
      },
      n = {
--        ["<C-p>"] = action_layout.toggle_preview
      },
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {

      initial_mode = "normal",
      theme = "dropdown",
    },
    grep_string = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
  extensions = {
    fzf = {
      print("hre"),
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                      -- the default case_mode is "smart_case"
    },

    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      previewer = require('telescope.previewers').vim_buffer_cat.new,
      mappings = {
        ["i"] = {
         -- ["<C-w>"] = function() vim.cmd('normal vbd') end
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["<C-w>"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
        },
      },
    },
  }
}

tel.load_extension('fzf')
tel.load_extension('file_browser')


vim.keymap.set("n", "sf", function()
  tel.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
