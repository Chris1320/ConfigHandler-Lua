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

local misc = require("misc")

--- Open a configuration file in simple mode.
-- @param filepath str The filepath of the configuration file.
-- @return table
local function Simple(filepath)
    local simple = {
        filepath = filepath,
        separator = '=',
        __data = {},  -- This will contain the key/value pairs in the configuration file.

        load = function (self)
            --- Load the contents of the configuration file to memory.
            local file_data = io.open(self.filepath, "r")
            if file_data == nil then
                error("Cannot read file.")
            end

            for line in io.lines(self.filepath) do
                local line_content = misc.splitStr(line, self.separator)
                self.__data[line_content[1]] = line_content[2]
            end
        end,

        get = function (self, key)
            -- TODO: Get key from self.__data
            return self.__data[key]
        end,

        set = function (self, key, value)
            -- TODO: Set key to value in self.__data
            self.__data[key] = value
        end,

        save = function (self)
            -- TODO: Save configuration file to self.filepath
            print("Save " .. self.filepath)
        end
    }
    return simple
end

return Simple
