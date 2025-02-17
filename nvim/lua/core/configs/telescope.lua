require("telescope").setup({

    defaults = {
        mappings = {
            i = {
                ["<C-g>"] = function(prompt_bufnr)
                    -- Use nvim-window-picker to choose the window by dynamically attaching a function
                    local action_set = require("telescope.actions.set")
                    local action_state = require("telescope.actions.state")

                    local picker = action_state.get_current_picker(prompt_bufnr)
                    picker.get_selection_window = function(picker, entry)
                        local picked_window_id = require("window-picker").pick_window()
                            or vim.api.nvim_get_current_win()
                        -- Unbind after using so next instance of the picker acts normally
                        picker.get_selection_window = nil
                        return picked_window_id
                    end

                    return action_set.edit(prompt_bufnr, "edit")
                end,
            },
        },
    },
    extensions = {
        lsp_handlers = {
            disable = {},
            location = {
                telescope = {},
                no_results_message = "No references found",
            },
            symbol = {
                telescope = {},
                no_results_message = "No symbols found",
            },
            call_hierarchy = {
                telescope = {},
                no_results_message = "No calls found",
            },
            code_action = {
                telescope = require("telescope.themes").get_dropdown({}),
                no_results_message = "No code actions available",
                prefix = "",
            },
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
    },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("lsp_handlers")
