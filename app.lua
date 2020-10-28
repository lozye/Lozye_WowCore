local Cache =package.Cache
local Object =package.Object


local Core = {}
do
    Core.RemoveFrame = function()
        MainMenuBarArtFrame.RightEndCap:Hide()
        MainMenuBarArtFrame.LeftEndCap:Hide()
        MicroButtonAndBagsBar:Hide()
    end
    Core.IgnoreMessage = function()
        local _cache = Cache.new(30)
    end
    Core.Main = function()
        Core.RemoveFrame()
        Core.IgnoreMessage()
    end
end

Core.Main()
