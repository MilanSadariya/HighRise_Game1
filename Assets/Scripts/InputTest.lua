print('CALL')

function OnTap(eventData)
    print('tapped')
end
Input.LongPressBegan:Connect(OnTap)
Input.LongPressContinue:Connect(OnTap)
Input.LongPressEnded:Connect(OnTap)
Input.MouseWheel:Connect(OnTap)
Input.PinchOrDragBegan:Connect(OnTap)
Input.PinchOrDragChanged:Connect(OnTap)
Input.PinchOrDragEnded:Connect(OnTap)
Input.Tapped:Connect(OnTap)

