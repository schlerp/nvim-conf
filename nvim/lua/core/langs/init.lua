local lua = require("core.langs.lua")
local python = require("core.langs.python")
local rust = require("core.langs.rust")
local markdown = require("core.langs.markdown")
local svelte = require("core.langs.svelte")
local html = require("core.langs.html")

local M = {
	[lua.lang_name] = lua,
	[python.lang_name] = python,
	[rust.lang_name] = rust,
	[markdown.lang_name] = markdown,
	[svelte.lang_name] = svelte,
	[html.lang_name] = html,
}

return M
