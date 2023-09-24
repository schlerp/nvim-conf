require("codegpt.config")

vim.g["codegpt_commands"] = {
    ["doc"] = {
        language_instructions = {
            python = "Use the Numpy/Scipy style docstrings.",
        },
        max_tokens = 1024,
    },
    -- custom command
    ["modernize"] = {
        user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nModernize the above code. Use current best practices. Only return the code snippet and comments. {{language_instructions}}",
    },
}
