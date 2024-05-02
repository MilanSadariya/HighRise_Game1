local item = nil

function self:OnCollisionEnter(hit)

    if hit.collider.gameObject == item then
        return
    end

    tag = hit.collider.gameObject.tag

    if  tag ==  "ThievesItem" then
        Collect(hit)
        
    elseif tag == "Platform" and item ~= nil  and self.transform.childCount >0  then 
            Put(hit)
    end

end



function Collect(hit)
     hit.collider.transform.parent = self.transform
     hit.collider.transform.localPosition = Vector3.new(0, 2, 0)
     item = hit.collider.gameObject
end

function Put(hit)

    item.transform.parent = hit.collider.transform
    -- item.transform.localPosition = hit.collider.transform.localPosition
    item.transform.localPosition = Vector3.zero
    -- item  = nil

end
