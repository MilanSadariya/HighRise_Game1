-- local PlayerMovement = {}

-- function PlayerMovement.new()
--     local self = {}

--     self.moveSpeed = 5.0 -- Speed of the player movement
--     self.turnSmoothTime = 0.1
--     self.turnSmoothVelocity = 0.0
--     self.controller = nil

--     function self.Update()
--         local horizontal = Input.GetAxis("Horizontal")
--         local vertical = Input.GetAxis("Vertical")
--         local direction = Vector3.new(horizontal, 0.0, vertical).unit

--         if direction.magnitude >= 0.1 then
--             local targetAngle = math.atan2(direction.x, direction.z) * 180 / math.pi
--             local angle = math.smoothDampAngle(transform.eulerAngles.y, targetAngle, self.turnSmoothVelocity, self.turnSmoothTime)
--             transform.rotation = Quaternion.Euler(Vector3.new(0.0, angle, 0.0))

--             controller.Move(direction.unit * self.moveSpeed * Time.deltaTime)
--         end
--     end

--     return self
-- end

-- return PlayerMovement




function PrintThis( string)
    print(string)
end
