local LozyeCommand = {Version = "9.2", Description = "cmd 指令监听"}
local Focus=LPackage.Focus;

do
    LozyeCommand.Listen = function()
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
end

LPackage.LozyeCommand = LozyeCommand
