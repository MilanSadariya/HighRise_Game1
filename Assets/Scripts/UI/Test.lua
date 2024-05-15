--!Type(UI)

--!Bind
local myLabel : UILabel = nil
--!Bind
local container : UIView = nil
--!Bind
local hrElement : VisualElement = nil

HrElement = hrElement
MyLabel = myLabel

function self:Awake()
    -- Your code here:
    Timer.After(3, function()
      hrElement:AddToClassList("hidden")
          print("GameObject has been disabled after 5 seconds.")
    end)

    Timer.After(6, function()
        hrElement:RemoveFromClassList("hidden")
            print("GameObject has been enable after 3 second")
      end)
end