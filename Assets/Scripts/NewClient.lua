local uisctipt  = self.gameObject:GetComponent("NewUI")

function OnLableClick()
    print("lable clicked")
end

uisctipt.Collect_Button:RegisterPressCallback(function() OnLableClick() end)

