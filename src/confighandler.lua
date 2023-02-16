#!/usr/bin/env lua

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

local info = require("info")
local misc = require("misc")
local simple = require("simple")

--- Open a simple configuration file.
-- @param filepath string The file to open.
-- @param main_menu_prompt string The prompt to show.
local function simpleConfigManager(filepath, main_menu_prompt)
    local prompt = filepath .. main_menu_prompt
    local config = simple(filepath)
    if config == nil then
        io.write("[E] There was an error opening the configuration file.\n")
    end

    while true do
        io.write(prompt)
        local scm_command = misc.splitStr(io.read("*l"))

        if scm_command[1] == "exit" then return
        elseif scm_command[1] == "help" then io.write(info.SIMPLE_INTERACTIVE_HELP)
        elseif scm_command[1] == "load" then
            if config ~= nil then config:load()
            else io.write("[E] Cannot load configuration file.\n")
            end

        elseif scm_command[1] == "save" then
            if scm_command[2] == "as" then
                io.write("Enter new filepath: ")
                local new_save_filepath = io.read("*l")
                config.filepath = new_save_filepath
            end
            if config ~= nil then
                config:save()
                io.write("[i] Configuration file saved.\n")

            else
                io.write("[E] Cannot save configuration file.\n")
            end

        elseif scm_command[1] == "get" then
            if config ~= nil then
                local key_value = config:get(scm_command[2])
                if key_value == nil then
                    key_value = "nil"
                end
                io.write(key_value .. '\n')

            else
                io.write("[E] Cannot get key value from configuration file.\n")
            end

        elseif scm_command[1] == "set" then
            if config ~= nil then
                config:set(scm_command[2], scm_command[3])

            else
                io.write("[E] Cannot set key value on configuration file.\n")
            end

        elseif scm_command[1] == "del" then
            if config ~= nil then
                config:remove(scm_command[2])

            else
                io.write("[E] Cannot remove key/value pair on configuration file.\n")
            end

        elseif scm_command[1] == "list" then
            if config ~= nil then
                for key, value in pairs(config.__data) do
                    io.write(key .. config.separator .. value .. '\n')
                end

            else
                io.write("[E] Cannot list key/value paris from configuration file.\n")
            end
        end
    end
end

--- The function that provides interactive mode.
-- @return int The exit code.
local function main()
    local prompt = " >>> "

    io.write(info.TITLE .. "\nEnter `exit` to exit interactive mode.\n\n")
    while true do
        io.write(prompt)
        local user_input = misc.splitStr(io.read("*l"))

        if user_input[1] == "exit" then
            return 0

        elseif user_input[1] == "help" then
            io.write(info.INTERACTIVE_HELP)

        elseif user_input[1] == "open" then
            if user_input[2] == "simple" then
                simpleConfigManager(user_input[3], prompt)

            elseif user_input[2] == "advanced" then
                io.write("[E] Not yet implemented.\n")

            else
                io.write("Unknown configuration file type: " .. user_input[2] .. '\n')
            end
        end
    end
end

-- Call the main function.
os.exit(main())
