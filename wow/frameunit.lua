local FrameUnit = {Version = "9.2", Description = "UI增强"}

do
    -- 团队框架增强
    local CompactUnitPlus = function()
        local n, w, h = "CompactUnitFrameProfilesGeneralOptionsFrame"
        h, w = _G[n .. "HeightSlider"], _G[n .. "WidthSlider"]
        h:SetMinMaxValues(20, 150)
        w:SetMinMaxValues(20, 300)
    end

    -- BUFF&DEBUFF 控制
    local CompactUnit_BuffPlus = function(f)
        if f.debuffFrames then
            for i = 1, #f.debuffFrames do
                local debuff = f.debuffFrames[i]
                if debuff and debuff.SetScale and debuff:IsShown() then
                    debuff.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
                    -- debuff:echo();
                    debuff:ClearAllPoints()
                    debuff:SetWidth(20)
                    debuff:SetHeight(20)
                    debuff:SetPoint("RIGHT", f, "RIGHT", i * 24, 0, true)
                end
            end
        end
        if f.buffFrames then
            -- print(f.buffFrames)
            for i = 1, #f.buffFrames do
                local buff = f.buffFrames[i]
                if buff and buff.SetScale and buff:IsShown() then
                    buff:ClearAllPoints()
                    buff:SetWidth(15)
                    buff:SetHeight(15)
                    buff:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", (i - 1) * -18 - 2, 2, true)
                end
            end
        end
    end -- end CompactUnit_BuffPlus

    -- 不要跨服名称
    local CompactUnit_NamePlus = function(f)
        if not GetRaidFrame(f) then return end
        if  f.name and f.name:IsShown() then            
            local name = UnitFullName(f.unit) or (GetUnitName(f.unit, true))
            f.name:SetText(name)
        end
    end


    GetRaidFrame=function(f)
        if not f then return false end
        if f.unit and string.find(f.unit, 'nameplate') then return false end
    
        local name = f:GetName()
        if not name then return false end
        local isRaidFrame = string.find(name, 'CompactRaidFrame')
        local isPartyFrame = string.find(name, 'CompactPartyFrame')
        local isRaidGroupFrame = string.find(name, 'CompactRaidGroup')
        if not isRaidFrame and not isPartyFrame and not isRaidGroupFrame  then return false end
        return true
    end

    local DefaultCompactUnitPlus = function(frame)
        CompactUnitFrame_SetMaxBuffs(frame,5);
    end

    -- 团队框架增强2
    local CompactUnitHook = function()
    
        --不要跨服名称
        hooksecurefunc("CompactUnitFrame_UpdateName", CompactUnit_NamePlus)
        -- debuff 设置
        hooksecurefunc("CompactUnitFrame_UpdateAuras", CompactUnit_BuffPlus)

        -- 默认设置
        --    hooksecurefunc('DefaultCompactUnitFrameSetup',DefaultCompactUnitPlus);
        --    hooksecurefunc('CompactUnitFrame_SetUnit', function (f, unit)
        --        if not unit then return end
        --        if not f:IsShown() then return end    
        --        DefaultCompactUnitPlus(f)
        --    end)
       
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
