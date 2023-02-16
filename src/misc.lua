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

--- Split a string <input_str> into a table of strings, separated by <separator>.
--- This function is based on `https://stackoverflow.com/a/7615129/15376542`.
-- @param input_str string The string to split.
-- @param separator string The separator to use.
-- @return table
local function splitStr(input_str, separator)
    local result = {}
    local sep = separator or "%s"  -- Use default (any whitespaces) when separator is not supplied.

    -- Separate input_str into a list of substrings based on separator.
    for separated_str in string.gmatch(input_str, "([^" .. sep .. "]+)") do
        table.insert(result, separated_str)  -- Insert each substring into result.
    end

    return result
end

return {
    splitStr = splitStr
}
