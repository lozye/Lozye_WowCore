-- https://github.com/blitmap/lua-snippets
local cstring = {
    substring = function(text, fromIndex, toIndex)
        return string.sub(text, fromIndex, toIndex)
    end,
    toLowerCase = function(text) return string.lower(text) end,
    toUpperCase = function(text) return string.upper(text) end
}
do
    --- lua 中索引是从1开始的
    local indexOf = function(text, searchString)
        return string.find(text, searchString, 1, true)
    end

    local trimStart = function(text)
        local res = text
        local tmp = string.find(res, '%S')

        -- string.sub() will create a duplicate if
        -- called with the first and last index
        -- (str_sub() in lstrlib.c)

        if not tmp then
            res = ''
        elseif tmp ~= 1 then
            res = string.sub(res, tmp)
        end

        return res, res ~= s
    end

    local trimEnd = function(text)
        local res = text
        local tmp = string.find(res, '%S%s*$')

        if not tmp then
            res = ''
        elseif tmp ~= #res then
            res = string.sub(res, 1, tmp)
        end
        return res, res ~= s
    end

    cstring.indexOf = indexOf
    cstring.trimStart = trimStart
    cstring.trimEnd = trimEnd

    -- Trims the whitespace from both ends of the string.
    cstring.trim = function(text)
        local res1, stat1 = trimStart(text)
        local res2, stat2 = trimEnd(res1)
        return res2, stat1 or stat2
    end
    -- 是否包含字符串
    cstring.contains = function(text, searchString)
        local idx, _ = indexOf(text, searchString)
        return idx ~= nil
    end
end

--[[
    -- debugs
    indx, b = cstring.indexOf("x1xxx", "1xx")
    chars = cstring.trimStart("    \n12121 ")
    print(chars)
]]
