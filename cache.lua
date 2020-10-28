local Cache = {Version = "9.0"}
do
    Cache.new = function(timeout_ms)
        local map = {Version = Cache.Version}
        local _cache = {}
        map.add = function(k)
            local temp = _cache[k]
            local current = GetTime()
            if (not temp or temp + timeout_ms < current) then
                _cache[k] = current
                return true
            else
                return false
            end
        end
        return map
    end
end
-- return Cache
package.Cache=Cache