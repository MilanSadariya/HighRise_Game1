--Type(UI)
--Bind
local myButton : UIButton = nil
local buttonLabel : UILabel = nil
local container : UIView = nil;
-- Function to handle button click

-- function self:Start()
--     Timer.After(5,
--     function()
--         myButton:AddToClassList("hidden")
--     end)
-- end
local function onButtonClick()
    print("Button clicked")
    buttonLabel:SetPrelocalizedText("Button Clicked!",true)
end

myButton:RegisterPressCallback( onButtonClick())


