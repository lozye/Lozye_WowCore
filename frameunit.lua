local FrameUnit = {Version = "9.2", Description = "UI增强"}

do
    -- 团队框架增强
    local CompactUnitPlus = function()
        local n, w, h = "CompactUnitFrameProfilesGeneralOptionsFrame"
        h, w = _G[n .. "HeightSlider"], _G[n .. "WidthSlider"]
        h:SetMinMaxValues(20, 150)
        w:SetMinMaxValues(20, 300)
    end

    local CompactUnit_SetTexture = function(frame)
        frame.healthBar:SetStatusBarTexture("media\\partyframe")
        -- frame.healthBar:SetStatusBarTexture(.75, .75, .75)
        -- print(frame.healthBar)
        -- print( tostring(frame.name));
    end

    -- 团队框架增强2 不要跨服名称
    local CompactUnitHook = function()
        hooksecurefunc('CompactUnitFrame_UpdateName', function (f)          
            if not f.name or not f.name:IsShown() then return end      
            local name = UnitFullName(f.unit) or (GetUnitName(f.unit, true))     
            f.name:SetText(name)
        end)
    end

    -- 动作条增强
    local MainMenuBarPlus = function()
        MainMenuBarArtFrame.RightEndCap:Hide()
        MainMenuBarArtFrame.LeftEndCap:Hide()
        MicroButtonAndBagsBar:Hide()
        StatusTrackingBarManager:Hide()
        -- https://github.com/Gethe/wow-ui-source/blob/1cf759abedf90eaf4adaa1be3629855626c2d998/FrameXML/MainMenuBar.lua
        -- MoveMicroButtons("TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 6, 3, true);
    end

    FrameUnit.Listen = function()
        CompactUnitHook()
        MainMenuBarPlus()
        CompactUnitPlus()
    end
end

LPackage.FrameUnit = FrameUnit
