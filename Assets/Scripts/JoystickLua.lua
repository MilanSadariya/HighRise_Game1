--!Type(UI)

--!Bind
local baseImage : UIImage = nil
local handleImage : UIImage = nil

local joystickPosition = Vector2.new(0, 0)
local joystickRadius = 50 -- Adjust as needed

print('CALL')

function UpdateJoystickPosition(inputPosition)
    print('update joystick position')
    -- Calculate the direction from the base center to the input position
    local direction = inputPosition - baseImage.layout.position

    -- If the input position is outside the joystick radius, clamp it to the radius
    if direction.magnitude > joystickRadius then
        direction = direction.normalized * joystickRadius
    end

    -- Update handle position
    handleImage.layout.position = handleImage.layout.position + direction

    -- Update joystick position
    joystickPosition = direction
end

function OnPointerDown(eventData)
    -- Calculate joystick position based on input
    local inputPosition = eventData.position
    UpdateJoystickPosition(inputPosition)
end

function OnDrag(eventData)
    -- Update joystick position while dragging
    local inputPosition = eventData.position
    UpdateJoystickPosition(inputPosition)
end

function OnPointerUp(eventData)
    -- Reset joystick position when releasing input
    UpdateJoystickPosition(baseImage.layout.position)
end

-- Subscribe to input events
print('CALL')

function OnTap(eventData)
    print('tapped')
end
Input.Tapped:Connect(OnTap)


Input.PinchOrDragBegan:Connect(OnTap)
Input.PinchOrDragChanged:Connect(OnTap)
Input.PinchOrDragEnded:Connect(OnTap)

Input.Tapped:Connect(OnTap)
Input.LongPressContinue:Connect(OnTap)
Input.LongPressEnded:Connect(OnTap)

