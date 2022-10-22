local App = {}
do
    -- 代码主入口
    App.Main = function()
        LPackage.Tooltip.Listen();
        LPackage.Chat.Listen();
    end
end

-- 通用入口
App.Main()
