local Chat = LPackage.Chat
local Focus = LPackage.Focus

local App = {}
do
    -- 主界面移除
    local RemoveFrame = function()
        MainMenuBarArtFrame.RightEndCap:Hide()
        MainMenuBarArtFrame.LeftEndCap:Hide()
        MicroButtonAndBagsBar:Hide()
        StatusTrackingBarManager:Hide()
        -- https://github.com/Gethe/wow-ui-source/blob/1cf759abedf90eaf4adaa1be3629855626c2d998/FrameXML/MainMenuBar.lua
        -- MoveMicroButtons("TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 6, 3, true);
    end

    local SlashCmd=function ()
        SlashCmdList['LOZYEFOCUS_SLASHCMD'] = function(msg)
            if(msg=="focus") then 
                Focus.Get();   
            elseif(msg=="show") then
                StatusTrackingBarManager:Show()    
            elseif(msg=="showbag") then
                MicroButtonAndBagsBar:Show()                
            else  
                DEFAULT_CHAT_FRAME:AddMessage("use /lo or /lozye ")
                DEFAULT_CHAT_FRAME:AddMessage("/lo focus   => get the focus info")         
                DEFAULT_CHAT_FRAME:AddMessage("/lo show    => show StatusTrackingBarManager") 
                DEFAULT_CHAT_FRAME:AddMessage("/lo showbag => show MicroButtonAndBagsBar")                
            end           
        end
        SLASH_LOZYEFOCUS_SLASHCMD1 = '/lozye'
        SLASH_LOZYEFOCUS_SLASHCMD2 = '/lo'
    end

    -- 代码主入口
    App.Main = function()
        SlashCmd();
        Chat.Listen()        
        RemoveFrame()
    end
end

-- 通用入口
App.Main()
