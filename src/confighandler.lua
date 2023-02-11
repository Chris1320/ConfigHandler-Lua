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

-- TODO: Interactive mode

local info = require("info")
local misc = require("misc")
local simple = require("simple")

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
            print("Opening " .. user_input[2])

        end
    end
end

os.exit(main())
