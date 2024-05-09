--!Type(UI)

--!Bind
-- local myButton : UIButton = nil
-- btn = myButton

-- local thiefButton : UIButton = nil
-- local policeButton : UIButton = nil

local myLabel : UILabel = nil


function SetText(text)
    myLabel:SetPrelocalizedText(text,true)
end

function _OnButtonClick()
   print('Button click')
end


function HideBtn()
    -- myButton:AddToClassList("Hide")

end


local label1 : UILabel = nil
local label2 : UILabel = nil

label1:SetPrelocalizedText("Label 1",true)
label2:SetPrelocalizedText("Label 2",true)


