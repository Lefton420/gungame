include("shared.lua")

-- Beta for plague storm
local sphereRadius = 500
local startTime = CurTime()

-- function SphereShrink()
--     local elapsedTime = CurTime() - startTime
--     local progress = math.Clamp(elapsedTime / 10, 0, 1)  -- clamp between 0 and 1
--     sphereRadius = Lerp(progress, 500, 1)
    
--     -- Remove the hook if the sphere's radius is 1
--     if sphereRadius <= 1 then
--         hook.Remove("PostDrawOpaqueRenderables", "DrawMySphere")
--     else
--         local spherePos = Vector(-120.875908, 409.494507, -83.968750)
--         render.SetColorMaterial()
--         render.DrawSphere(spherePos, -sphereRadius, 30, 30, Color(60,52,52,150))
--         render.DrawSphere(spherePos, sphereRadius, 30, 30, Color(60,52,52,150))
--     end
-- end

-- hook.Add("PostDrawOpaqueRenderables", "DrawMySphere", SphereShrink)
