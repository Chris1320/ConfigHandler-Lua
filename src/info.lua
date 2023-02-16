--[[
MIT License

Copyright (c) 2023 Chris1320

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]--

local NAME = "ConfigHandler-Lua"
local VERSION = {0, 0, 2}
local TITLE = NAME .. " v" .. table.concat(VERSION, '.')

local INTERACTIVE_HELP = [[
open <type> <filepath>        Open <filepath> using <type> configuration handler.

help                          Show this help menu.
exit                          Exit interactive console.
]]

local SIMPLE_INTERACTIVE_HELP = [[
load                     Load the configuration file.
save [as]                Save the configuration file. If `as` is added as an argument, ask for a new filepath.
info                     Show information about the configuration file.
readonly                 Toggle read-only mode of the configuration file.

get <key>                Get the value of a key.
set <key> <value>        Set the value of a key.
del <key>                Remove an existing key/value pair from the configuration file.
list                     List all existing key/value pairs in the configuration file.

base64                   Toggle base64 encoding of the configuration file.

help                     Show this help menu.
exit                     Close the configuration file.
]]

return {
    NAME = NAME,
    VERSION = VERSION,
    TITLE = TITLE,
    INTERACTIVE_HELP = INTERACTIVE_HELP,
    SIMPLE_INTERACTIVE_HELP = SIMPLE_INTERACTIVE_HELP
}
