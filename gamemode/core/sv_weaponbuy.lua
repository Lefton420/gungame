local function buymenu_create()
    local rando = math.random(1,100) 
    print(rando)
end

hook.Add( "KeyPress", "buymenu", buymenu_create)