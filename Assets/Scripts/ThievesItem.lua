

function self:OnCollisionEnter(hit)

    print('collision enter ' , hit.collider.gameObject.name)
    if hit.collider.gameObject.name == "CharacterCollider" then
        OnCollect(hit)
        end
end

function OnCollect(hit)
    self.transform.parent = hit.transform
    self.transform.localPosition = Vector3.new(0, 1.75, 0)
end

 function Hello()
    print('hello')
end




