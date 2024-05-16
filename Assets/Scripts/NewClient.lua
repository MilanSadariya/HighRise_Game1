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

-- uisctipt.Collect_Button:RegisterPressCallback(
--     function()
--          OnLableClick() 
--         -- uisctipt.HideThieveUI()
--     end)

-- uisctipt.Caught_Button:RegisterPressCallback(
--         function()



--             -- if isThieveUI then
--             --     -- uisctipt.HideThieveUI()
--             --     uisctipt.ThieveUI:AddToClassList("disable")
--             --     isThieveUI = false
--             -- else 
--             --     -- uisctipt.ShowThieveUI()
--             --     uisctipt.ThieveUI:RemoveFromClassList("disable")
--             --     isThieveUI = true
--             -- end
--         end)
    




