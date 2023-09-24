local M = {}

---Try to import a module at the given path, return nil on error
---@param module_name string The path of the module to attempt to import
---@return table | nil
M.try_import_module = function(module_name)
    local success, module = pcall(require, module_name)
    if success == true then return module end
    return nil
end

return M
