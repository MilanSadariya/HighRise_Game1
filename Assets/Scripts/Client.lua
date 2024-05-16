local uisctipt  = self.gameObject:GetComponent("Test")

function OnLableClick()
    print("lable clicked")
end

uisctipt.MyLabel:RegisterPressCallback(function() uisctipt:Hide() end)
