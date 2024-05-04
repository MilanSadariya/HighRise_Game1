--!SerializeField
local item : GameObject = nil

function Reproduce()
Timer.After(10,
    function() 
        local object =  Object.Instantiate(item)
        object.transform.parent = self.transform
        object.transform.localPosition = Vector3.zero
    end
)
end


