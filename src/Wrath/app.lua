local App = {}
do
    -- 代码主入口
    -- https://github.com/Gethe/wow-ui-source/tree/3.4.3/Interface_Wrath/FrameXML
    App.Main = function()
        LPackage.Tooltip.Listen();
        LPackage.Chat.Listen();
    end
end

-- 通用入口
App.Main()
