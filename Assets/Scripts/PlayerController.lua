
--!SerializeField
local policeCap : GameObject = nil
--!SerializeField
local thieveCap : GameObject = nil
--!SerializeField
local caughtParticle : GameObject = nil

local collectedItem = nil
local role  = nil
local destroyingItem = nil

local gameManager = require("GameManager")



function self:Update()

    -- if destroyingItem ~= nil then
    --     if destroyingItem.transform.localScale.x > 0.05 then
    --         destroyingItem.transform.localScale -= Vector3.one *  0.01 * Time.deltaTime
    --         print('scale')
    --     else 
    --         Object.Destroy(destroyingItem)
    --         destroyingItem = nil
    --         print('destroy') 
    --     end
    -- end
end

function self:OnCollisionEnter(hit)
    
    -- When role not selected
    if role == nil then
        -- print("nil  , ",hit.collider.gameObject.tag ) 
        if hit.collider.gameObject.tag == "ThievesButton" then
            print("ThievesButton")
            OnSelectRole("Thieves")
        elseif hit.collider.gameObject.tag == "PoliceButton" then
            OnSelectRole("Police")
        end
        return
    end

    -- When role is Thieves 
    if role == "Thieves" then
        
        -- When collide collected object
        if hit.collider.gameObject == collectedItem then
            return
        end
        
        tag = hit.collider.gameObject.tag
        
        if  tag ==  "ThievesItem"  and self.transform.childCount == 0 then 
            Collect(hit)
        
        elseif tag == "Platform" and collectedItem ~= nil  and self.transform.childCount > 0  then 
            Put(hit)
        end

    -- When role is Police
    elseif role == "Police" then
        if hit.collider.gameObject.name == "Thieves" and hit.collider.transform.childCount > 0 then
            print('collide with Thieves')

            hit.collider.gameObject:GetComponent("PlayerController"):ThievesCaught()

            Timer.After(1, function()
                gameManager.WinPanel:SetActive(true)
                -- gameManager.UserInterface.SetText("You Win, Reselect your role")
                Timer.After(3, function()
                    RemoveRole()
                end)
            end
            )
    end

    end
end

-- Select role
function OnSelectRole(_role)
    self.gameObject.name = _role
    role = _role
    -- set cap
    if role == "Police" then 
        policeCap.SetActive(policeCap, true)
    elseif role == "Thieves" then
        thieveCap.SetActive(thieveCap, true)
        gameManager.ThieveQuests:SetActive(true)
        -- gameManager.UserInterface.SetText("Steal the Crystal from the first floor, then sell it in a green plane")
    end
end

function RemoveRole()
    policeCap.SetActive(policeCap, false)
    thieveCap.SetActive(thieveCap, false)
    gameManager.ThieveQuests:SetActive(false)
    gameManager.WinPanel:SetActive(false)
    gameManager.LosePanel:SetActive(false)
    role = nil
    self.gameObject.name = "NewCharacter"
    -- gameManager.UserInterface.SetText("")
end


-- Collect Item
function Collect(hit)
    hit.collider.transform.parent:GetComponent("ThievesItem"):Reproduce()

    hit.collider.transform.parent = self.transform
    hit.collider.transform.localPosition = Vector3.new(0.03, 0.05, 0.29)
    -- hit.collider.transform.localPosition = Vector3.new(0, 2, 0)
    collectedItem = hit.collider.gameObject
end

-- Put and destroy Item
function Put(hit)
    collectedItem.transform.parent = hit.collider.transform
    collectedItem.transform.localPosition = Vector3.zero
    collectedItem.transform.localScale += (Vector3.one -  collectedItem.transform.parent.transform.localScale) 
    destroyingItem = collectedItem
    collectedItem.tag = "DestroyedThievesItem"
    local itemAnimator : Animator = collectedItem:GetComponent(Animator)
    itemAnimator:PlayInFixedTime("CrystalDestroy", 0)
    Timer.After(2, function() Object.Destroy(collectedItem)end)
    -- gameManager.UserInterface.SetText("You Win, Reselect your role")
end

-- Reset Position and remove item
function ThievesCaught()
    print('caught Thieves')
    caughtParticle.SetActive(caughtParticle, true)
    Timer.After(0.5,
        function()
            self.transform.parent.localPosition = Vector3.zero
            -- Camera.main.gameObject:GetComponent("RTSCamera"):CenterOn(Vector3.zero)
            -- Camera.main.transform.localPosition = Vector3.new(-17.14054, 13.99519, -17.14054)
            caughtParticle.SetActive(caughtParticle, false)
            if self.transform.childCount > 0 then
                Object.Destroy(self.transform.GetChild(self.transform, 0).gameObject)
            end
            
            gameManager.LosePanel:SetActive(true)
            -- gameManager.UserInterface.SetText("You Lose, Reselect your role")
            Timer.After(3, function()
                RemoveRole()
            end
            )

        end
        )   
end



