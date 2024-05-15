
-- local gameManager  = require("GameManager")
local testUI = self.gameObject.GetComponent(self.gameObject,"Kosti")

function self:Start()

    print( testUI.My_Button)
    testUI._OnButtonClick()

    -- Timer.After(3, function()
    --     testUI.My_Button:AddToClassList("hidden")
    --         print("GameObject has been disabled after 10 seconds.")
    --   end)

    -- local CollectBtn = gameManager.GMCollectBtn

    function PrintOnCLick()
        print("clickeed") 
    end

    print( testUI.My_Button)
    testUI.My_Button:RegisterPressCallback(function()PrintOnCLick() end)

    -- CollectBtn.RegisterPressCallback(function()PrintOnCLick() end)
end