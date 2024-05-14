
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


function self:OnCollisionEnter(hit)
    
    hitObject = hit.collider.gameObject

    if hitObject.tag ~= role then
        if hit.collider.gameObject.tag == "ThievesButton" then
            RemoveRole()
            OnSelectRole("Thieves")
        elseif hit.collider.gameObject.tag == "PoliceButton" then
            RemoveRole()
            OnSelectRole("Police")
        end
    end

    -- When role is Thieves 
    if role == "Thieves" then
        
        -- When collide collected object
        if hitObject == collectedItem then  
            return
        end
        
        if  hitObject.tag ==  "ThievesItem"  and self.transform.childCount == 0 then 
            Collect(hit)
        
        elseif  hitObject.tag  == "Platform" and collectedItem ~= nil  and self.transform.childCount > 0  then 
            Put(hit)
        end



    -- When role is Police
    elseif role == "Police" then
        if hitObject.name == "Thieves" and hitObject.transform.childCount > 0 then
            print('collide with Thieves')

           hitObject:GetComponent("PlayerController"):ThievesCaught()

    end

    end
end

-- Select role
function OnSelectRole(_role)
    self.gameObject.name = _role
    role = _role

    -- set cap
    if role == "Police" then 
        policeCap.transform.localScale = Vector3.one
    elseif role == "Thieves" then
        thieveCap.transform.localScale = Vector3.one
         ShowEverythingInCamera()
    end
end
    
function RemoveRole()
        policeCap.transform.localScale = Vector3.zero
        thieveCap.transform.localScale = Vector3.zero
        role = nil
        self.gameObject.name = "NewCharacter"
        HideDirectionArrowInCamera()
end






-- Collect Item
function Collect(hit)
    hit.collider.transform.parent:GetComponent("ThievesItem"):Reproduce()

    hit.collider.transform.parent = self.transform
    hit.collider.transform.localPosition = Vector3.new(0.03, 0.05, 0.29)
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

        end
        )   
end



-- Camera Culling Mask assign

local function bitwiseOR(a, b)
    local result = 0
    local bit = 1
    while a > 0 or b > 0 do
        if a % 2 == 1 or b % 2 == 1 then
            result = result + bit
        end
        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bit = bit * 2
    end
    return result
end

-- Bitwise AND function
local function bitwiseAND(a, b)
    local result = 0
    local bit = 1
    while a > 0 and b > 0 do
        if a % 2 == 1 and b % 2 == 1 then
            result = result + bit
        end
        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bit = bit * 2
    end
    return result
end

local cameraLayer = 511
local maskLayer = 479 
local uiLayer = 63

function HideDirectionArrowInCamera()
    Camera.main.cullingMask = bitwiseAND(cameraLayer, maskLayer)
end

function ShowEverythingInCamera()
    Camera.main.cullingMask = bitwiseOR(cameraLayer, uiLayer)
end
