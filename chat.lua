local Cache = LPackage.Cache

local Chat = {Version = "9.0.2"}
do
    local config = {
        {"综合", 1, 6, "综"},
        {"交易", 1, 6, "交"},
        {"公会", 1, 6, "公"},
        {"本地防务", 1, 12, "本"},
        {"寻求组队", 1, 12, "组"},
        {"大脚世界频道", 1, 18, "世"}
    }

    -- 获取短聊天频道
    local get = function(chname)
        for k, v in pairs(config) do
            if chname == v[1] or (#chname > v[3] and string.sub(chname, v[2], v[3]) == v[1]) then
                return v[4]
            end
        end
        return nil
    end

    -- 是否已经替换了聊天频道名称
    local hasset = {}

    -- 为什么随意改聊天频道名称不能成功 https://github.com/Gethe/wow-ui-source/blob/1cf759abedf90eaf4adaa1be3629855626c2d998/FrameXML/ChatFrame.lua#L3490
    local hassetfn = function(self, arg9, temp)
        if (not hasset[arg9]) then
            for index, value in pairs(self.channelList) do
                if get(value) == temp then
                    self.channelList[index] = temp
                    break
                end
            end
            hasset[arg9] = true
        end
    end

    -- 参数说明 https://github.com/Gethe/wow-ui-source/blob/1cf759abedf90eaf4adaa1be3629855626c2d998/AddOns/Blizzard_APIDocumentation/ChatInfoDocumentation.lua
    local chat_msg_channel = function(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, ...) --main function
        local temp, chview, chname = get(arg9), arg4, arg9
        -- 短频道
        if (temp ~= nil) then
            hassetfn(self, arg9, temp)
            chname = temp
            chview = arg8 .. ". " .. temp
        end

        -- 聊天过滤
        -- todo

        return false, arg1, arg2, arg3, chview, arg5, arg6, arg7, arg8, chname, ...
    end

    -- 对外注册
    Chat.Listen = function(...)
        ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", chat_msg_channel)
    end
end

LPackage.Chat = Chat
