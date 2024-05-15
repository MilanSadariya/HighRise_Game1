--!Type(Client)
local ui = self.gameObject:GetComponent("UIView")
local collectBtn = ui.CollectButton

print("call")
function self:Start()

    collectBtn:RegisterPressCallback(function()print("new button click")end)

--     Timer.After(2, 
-- function()
--     collectBtn.
-- end
-- )

end