local M = {}

--- Get the current git branch name
---@returns string
local function get_current_git_branch()
    local handle = io.popen("git rev-parse --abbrev-ref HEAD 2> /dev/null")
    if handle then
        local branch_name = handle:read("*l")
        handle:close()
        if branch_name then
            return branch_name
        else
            return "" -- Return empty string if no branch name found
        end
    else
        return "" -- Return empty string if command fails
    end
end

--- Get the current git branch name
---@returns string
local function get_default_git_branch()
    local handle =
        io.popen("git symbolic-ref refs/remotes/origin/HEAD | cut -d '/' -f4")
    if handle then
        local branch_name = handle:read("*l")
        handle:close()
        if branch_name then
            return branch_name
        else
            return "" -- Return empty string if no branch name found
        end
    else
        return "" -- Return empty string if command fails
    end
end

--- Build config to open lines in current branch
---@returns snacks.gitbrowse.Config
function M.build_gitbrows_config(in_current_branch, is_visual)
    -- set defaults
    if in_current_branch == nil then in_current_branch = true end
    if is_visual == nil then is_visual = false end

    -- get the current visual selection lines if visual mode
    local start_line = nil
    local end_line = nil
    if is_visual == true then
        start_line = vim.fn.line("v") -- Get the starting line of the visual selection
        end_line = vim.fn.line(".") -- Get the ending line of the visual selection
        if start_line > end_line then
            start_line, end_line = end_line, start_line -- Swap if necessary
        end
    end

    -- get the branch
    local branch
    if in_current_branch == true then
        branch = get_current_git_branch()
    else
        branch = get_default_git_branch()
    end

    -- build the config
    return {
        notify = true,
        what = "file",
        branch = branch,
        line_start = start_line,
        line_end = end_line,
    }
end

return M
