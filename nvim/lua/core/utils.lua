local M = {}

---Try to import a module at the given path, return nil on error
---@param module_name string The path of the module to attempt to import
---@return table | nil
M.try_import_module = function(module_name)
    local success, module = pcall(require, module_name)
    if success == true then return module end
    return nil
end

--- Check if a value is in an array
---@param value any The path of the module to attempt to import
---@param array table The path of the module to attempt to import
---@return boolean
M.is_in_array = function(value, array)
    for _, v in ipairs(array) do
        if v == value then return true end
    end
    return false
end

--- Check if a value is in a tables keys
---@param value any The path of the module to attempt to import
---@param array table The path of the module to attempt to import
---@return boolean
M.is_in_table_keys = function(value, array)
    for k, _ in pairs(array) do
        if k == value then return true end
    end
    return false
end

--- Check if a value is in a tables values
---@param value any The path of the module to attempt to import
---@param array table The path of the module to attempt to import
---@return boolean
M.is_in_table_values = function(value, array)
    for _, v in pairs(array) do
        if v == value then return true end
    end
    return false
end

--- Check if a value is truthy according to common conventions
---@param value string The value to check if it should represent true
---@return boolean
M.is_truthy = function(value)
    local truthy_values = { "true", "1", "yes", "t", "y" }
    if M.is_in_array(value:lower(), truthy_values) then
        return true
    else
        return false
    end
end

--- Get a boolean value from an environment variable
---@param env_var_name string The path of the module to attempt to import
---@param default boolean The path of the module to attempt to import
---@return boolean
M.get_env_bool = function(env_var_name, default)
    -- default is optional, default to false
    if default == nil then default = false end

    -- get the value of the environment variable
    local value = os.getenv(env_var_name)

    -- handle the default case
    if value == nil then return default end

    -- work out if it is truthy
    return M.is_truthy(value)
end

return M
