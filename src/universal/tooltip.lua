local Tooltip = {
    Version = "9.0",
    Description = "鼠标信息"
}
do
    local GetItem= function(self)
    
      local name2 = self..GetItem()
      if link then
        local name, link, quality, ilvl = GetItemInfo(link)
        local ItemInventoryType = C_Item.GetItemInventoryTypeByID(link)
        if ItemInventoryType ~= 0  and quality and ilvl then
          GameTooltip:AddLine( STAT_AVERAGE_ITEM_LEVEL..": "..ITEM_QUALITY_COLORS[quality].hex..ilvl)
        end
      end
    end

    -- 执行获取焦点
    Tooltip.Listen = function()    
        print("11)   
        GameTooltip:HookScript("OnTooltipSetItem",GetItem)
    end
end

LPackage.Tooltip = Tooltip
