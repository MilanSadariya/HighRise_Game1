local uisctipt  = self.gameObject:GetComponent("UserInterface")


function _OnClick()
    print('Test UI complete  ', uisctipt.MYButton.name )
    -- uisctipt.HideBtn()
end

-- uisctipt.MYButton:RegisterPressCallback(function() _OnClick() end)



function OnLableClick()
    print("lable clicked")
end


-- uisctipt.MyLabel:RegisterPressCallback(function() OnLableClick() end)

local thiefButton = uisctipt.MYButton -- Replace “thiefButton” with the actual ID of your button
if thiefButton then
    thiefButton.Clicked:Connect(function()
        -- Handle button click here
        print("Thief button clicked!")
        -- You can perform any other actions you need
    end)
end
































-- uisctipt.btn:RegisterLongPressCallback(function() _OnClick() end)
-- uisctipt.btn:RegisterCallback(function() _OnClick() end)

-- uisctipt.btn:click(function() _OnClick() end)
-- uisctipt.btn:event(function() _OnClick() end)
-- uisctipt.btn:OnTap(function() _OnClick() end)


-- uisctipt.btn.RegisterCallback(function() _OnClick() end)
-- uisctipt.btn.RegisterLongPressCallback(function() _OnClick() end)
-- uisctipt.btn.RegisterPressCallback(function() _OnClick() end)

-- uisctipt.btn.click(function() _OnClick() end)

