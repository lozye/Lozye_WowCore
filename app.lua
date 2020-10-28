local Chat = LPackage.Chat

local App = {}
do
    -- 主界面移除
    local RemoveFrame = function()
        MainMenuBarArtFrame.RightEndCap:Hide()
        MainMenuBarArtFrame.LeftEndCap:Hide()
        MicroButtonAndBagsBar:Hide()
    end

    -- 代码主入口
    App.Main = function()
        Chat.Listen()
        RemoveFrame()
    end
end
-- 通用入口
App.Main()
