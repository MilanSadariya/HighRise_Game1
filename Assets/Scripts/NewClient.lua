local uisctipt  = self.gameObject:GetComponent("NewUI")
local isThieveUI = false
local isPoliceUI = false
local gameManager = require("GameManager")
UIScript = uisctipt


function self:Awake()
    gameManager.UIClient = self.gameObject:GetComponent("NewClient")
end

function OnLableClick()
    print("lable clicked")
end

function EnableUI()
    uisctipt:EnableUI()
end

function DisableUI()
    uisctipt:DisableUI()
end


function ShowPoliceUI()
    uisctipt.HideThieveUI()
    uisctipt.ShowPoliceUI()
    uisctipt.HideThieveQuest()
end

function ShowThieveUI()
    uisctipt.ShowThieveUI()
    uisctipt.HidePoliceUI()
    uisctipt.ShowThieveQuest()
end

uisctipt.Collect_Button:RegisterPressCallback(
    function()
         OnLableClick() 
       uisctipt:ShowThieveQuest()
    --    gameManager.UIClient.uisctipt:ShowThieveQuest()
    end)

uisctipt.Caught_Button:RegisterPressCallback(
        function()


           uisctipt:HideThieveQuest()
            -- gameManager.UIClient.uisctipt:HideThieveQuest()

            -- if isThieveUI then
            --     uisctipt.ThieveUI:AddToClassList("disable")
            --     isThieveUI = false
            -- else 
            --     -- uisctipt.ShowThieveUI()
            --     uisctipt.ThieveUI:RemoveFromClassList("disable")
            --     isThieveUI = true
            -- end
        end)
    




