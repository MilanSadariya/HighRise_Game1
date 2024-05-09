
function self: Update()
    -- print("ok")
    -- targetRotation = Quaternion.LookRotation(Vector3.zero - self.transform.position , Vector3.zero)
    -- self.transform.rotation = targetRotation

    -- direction =  Vector3.zero - self.transform.localPosition
    -- if direction ~= Vector3.zero then
    --     targetRotation = Quaternion.LookRotation(Vector3.zero, Vector3.zero)
    --     self.transform.rotation = targetRotation
    -- end
    
    targetPosition = Vector3.zero - self.transform.parent.localPosition
    self.transform.forward = Vector3.new(targetPosition.x, 0, targetPosition.z)
    -- self.transform.forward = Vector3.new((Vector3.zero - self.transform.parent.localPosition).x, 0, (Vector3.zero - self.transform.parent.localPosition).z)

end
