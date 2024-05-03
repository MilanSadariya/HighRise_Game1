local animator = self.gameObject:GetComponent(Animator)

function self:OnCollisionEnter(hit)

    if hit.collider.gameObject.tag == "Platform" then
        print('DestroyedThieveItem')
        self.gameObject.tag = "DestroyedThieveItem"
    end

end

function DestroyWithAnimation()

    while self.transform.localScale.x > 0.01
    do self.transform.localScale -= Vector3.one * 0.01 * Time.deltaTime
    end
        
end

local function Hello()
    print('hello')
end




