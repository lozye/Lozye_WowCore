local App = {}
do

    local CVarSetting=function()
        -- 不显示小队框体 跨服服务器
        C_CVar.SetCVar("commentatorLossOfControlTextNameplate", 0);        -- 
        C_CVar.SetCVar('predictedHealth', 1)     
    end

    -- 代码主入口
    -- https://github.com/Gethe/wow-ui-source/tree/3.4.3/Interface_Wrath/FrameXML
    App.Main = function()
        CVarSetting();
        -- LPackage.Tooltip.Listen();
        LPackage.Chat.Listen();
    end
end

-- 通用入口
App.Main()
