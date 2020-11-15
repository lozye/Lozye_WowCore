local Focus = {
    Version = "9.0",
    Description = "鼠标焦点信息"
}
do
    local temp = nil

    -- 获取指定frame的信息及子frame信息
    local getframeinfo = function(frame)
        if frame == nil then
            return
        end
        print(frame:GetName())
        --print(frame:GetItem())

        local regions = frame:GetRegions()
        for k, v in ipairs(regions) do
            print(v)
            if v:GetObjectType() == "FontString" then                
                table.insert(temp, v:GetText())
            end
        end

        local children = frame:GetChildren()
        for k, v in ipairs(children) do
            getframeinfo(v)
        end
    end

    -- 执行获取焦点
    Focus.Get = function()
        local frame = GetMouseFocus()
        temp = {}
        getframeinfo(frame)
        if (#temp > 0) then
            print(table.concat(temp, "\n"))
        end
    end
end

LPackage.Focus = Focus
