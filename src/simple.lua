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
    return {
        filepath = filepath,
        separator = '=',
        comment_char = '#',
        forbidden_key_chars = {'\n'},
        __data = {},  -- This will contain the key/value pairs in the configuration file.

        _parseKey = function (self, key)
            --- Check if <key> is valid.
            -- @return bool true if the key is valid. Otherwise, false.
            if key:match(self.separator) ~= nil then
                return false

            elseif key[1] == self.comment_char then
                return false
            end

            for char in pairs(self.forbidden_key_chars) do
                if key:match(char) ~= nil then
                    return false
                end
            end

            return true  -- The key is valid.
        end,

        load = function (self)
            --- Load the contents of the configuration file to memory.
            local file_data = io.open(self.filepath, 'r')
            if file_data == nil then
                error("Cannot read file.")
            end

            for line in file_data:lines() do
                local line_content = misc.splitStr(line, self.separator)
                self.__data[line_content[1]] = line_content[2]
            end
        end,

        get = function (self, key)
            return self.__data[key]
        end,

        set = function (self, key, value)
            if not self:_parseKey(key) then
                error("Key contains invalid characters.")
            end

            self.__data[key] = value
        end,

        save = function (self)
            local file_data = io.open(self.filepath, 'w')
            if file_data == nil then
                error("Cannot write to file.")
            end

            for key, value in pairs(self.__data) do
                file_data:write(key .. self.separator .. value .. '\n')
            end
        end
    }
end

return Simple
