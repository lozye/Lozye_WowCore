local Chat = LPackage.Chat

local App = {}
do
    -- 主界面移除
    local RemoveFrame = function()
        MainMenuBarArtFrame.RightEndCap:Hide()
        MainMenuBarArtFrame.LeftEndCap:Hide()        
        MicroButtonAndBagsBar:Hide()
        StatusTrackingBarManager:Hide();
        -- https://github.com/Gethe/wow-ui-source/blob/1cf759abedf90eaf4adaa1be3629855626c2d998/FrameXML/MainMenuBar.lua
        -- MoveMicroButtons("TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 6, 3, true);
    end

    -- 代码主入口
    App.Main = function()
        Chat.Listen()
        RemoveFrame()
    end
end
-- 通用入口
App.Main()
