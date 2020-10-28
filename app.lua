local Cache = LPackage.Cache

local Core = {}
do
    -- 主界面移除
    Core.RemoveFrame = function()
        MainMenuBarArtFrame.RightEndCap:Hide()
        MainMenuBarArtFrame.LeftEndCap:Hide()
        MicroButtonAndBagsBar:Hide()
    end
    -- 消息过滤
    Core.IgnoreMessage = function()
        local _cache = Cache.new(30)
    end
    Core.Main = function()
        Core.RemoveFrame()
        Core.IgnoreMessage()
    end
end
-- 通用入口
Core.Main()
