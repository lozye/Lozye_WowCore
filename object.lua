local Object = {Version = "9.0"}
do
    Object.defineProperty = function(map, props)
        local o = {}
        setmetatable(map, o)

        o.__index = function(t, k)
            if (props[k]) then
                local fn = props[k].get
                if (fn) then
                    return fn()
                else
                    return nil
                end
            else
                return o[k]
            end
        end
        o.__newindex = function(t, k, v)
            if (props[k]) then
                local fn = props[k].set
                if (fn) then
                    fn(v)
                end
            else
                o[k] = v
            end
        end
    end
    -- end defineProperty
end
-- return Object

LPackage.Object = Object
