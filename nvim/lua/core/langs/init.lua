local lua = require("core.langs.lua")
local python = require("core.langs.python")
local rust = require("core.langs.rust")
local markdown = require("core.langs.markdown")
local svelte = require("core.langs.svelte")

local M = {
	[lua.lang_name] = lua,
	[python.lang_name] = python,
	[rust.lang_name] = rust,
	[markdown.lang_name] = markdown,
	[svelte.lang_name] = svelte,
}

return M
