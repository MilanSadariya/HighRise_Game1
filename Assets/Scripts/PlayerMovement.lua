unityengine  = require("UnityEngine")
--!SerializeField
local speed : number = 5

--!SerializeField
local rb : Rigidbody = nil

-- Vector to store player movement direction
local movement = Vector3.zero


function self:Update()
    -- Input
   local moveHorizontal = 0.1
    local moveVertical = 0.1

    -- Calculate movement direction based on input
   movement:Set(moveHorizontal, 0, moveVertical)
  movement:Normalize()
end

function self:FixedUpdate()
    rb:MovePosition(rb.position + movement * speed * Time.fixedDeltaTime)
end

