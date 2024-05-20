--Type(UI)
--!Bind
local container : UIView = nil;

-- {{  Thieve UI  }}

--!Bind
local thieveUI : VisualElement = nil
--!Bind
local collectButton : UIButton = nil

Collect_Button = collectButton
ThieveUI = thieveUI


-- {{  Police UI  }}

--!Bind
local policeUI : VisualElement = nil
--!Bind
local caughtButton : UIButton = nil

Caught_Button = caughtButton
PoliceUI = policeUI



--Type(UI)
--!Bind
local title : UILabel = nil;
--!Bind
local line1 : UILabel = nil;
--!Bind
local description1 : UILabel = nil;
--!Bind
local line2 : UILabel = nil;
--!Bind
local description2 : UILabel = nil;
--!Bind
local line3 : UILabel = nil;
--!Bind
local description3 : UILabel = nil;
--!Bind
local line4 : UILabel = nil;
--!Bind
local description4 : UILabel = nil;
--!Bind
local thieveQuest : VisualElement = nil

title:SetPrelocalizedText("Thief Quest", true)
line1:SetPrelocalizedText(" ", true)
description1:SetPrelocalizedText("Steal Crystals on the first floor \nto sell in the Green Zone", true)
line2:SetPrelocalizedText(" ", true)
description2:SetPrelocalizedText("Steal Potion on the ground floor \nto sell in the Green Zone", true)
line3:SetPrelocalizedText(" ", true)
description3:SetPrelocalizedText("Steal Radio on the second floor \nto sell in the Green Zone", true)
line4:SetPrelocalizedText(" ", true)
description4:SetPrelocalizedText("Steal Book on the second floor \nto sell in the Green Zone", true)


--------[[Police Wuest]]

--!Bind
local ptitle2 : UILabel = nil;
--!Bind
local pline2 : UILabel = nil;
--!Bind
local pdescription2 : UILabel = nil;

ptitle2:SetPrelocalizedText("Police Quest", true)
pline2:SetPrelocalizedText(" ", true)
pdescription2:SetPrelocalizedText("Catching the thief when he stealing.", true)




----------






function self:Awake()
    HidePoliceUI()
    HideThieveUI()
    HideThieveQuest()

    policeUI:AddToClassList("disable")
    thieveUI:AddToClassList("disable")

end

function HideThieveQuest()
    thieveQuest:AddToClassList("hidden")
end

function ShowThieveQuest()
    thieveQuest:RemoveFromClassList("hidden")
end


function DisableUI(ui)
    ui:AddToClassList("disable")
end

function EnableUI(ui)
    ui:RemoveFromClassList("disable")
end

function HideThieveUI()
    thieveUI:AddToClassList("hidden")
end

function ShowThieveUI() 
    thieveUI:RemoveFromClassList("hidden")
end

function HidePoliceUI()
    policeUI:AddToClassList("hidden")
end

function ShowPoliceUI() 
    policeUI:RemoveFromClassList("hidden")
end

function EnableUI()
    policeUI:RemoveFromClassList("disable")
    thieveUI:RemoveFromClassList("disable")
end

function DisableUI()
    policeUI:AddToClassList("disable")
    thieveUI:AddToClassList("disable")
end

-- function EnableUI(ui , value)
--     if value then
--         ui:RemoveFromClassList("disable")
--     else
--         ui:AddToClassList("disable")
--     end
-- end

function BookSteald()
    description4:AddToClassList("greenColor")
end
function RadioSteald()
    description3:AddToClassList("greenColor")
end
function PotionSteald()
    description2:AddToClassList("greenColor")
end
function CrystalsSteald()
    description1:AddToClassList("greenColor")
end
