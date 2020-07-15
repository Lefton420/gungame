function doBuy(ply)
    local frags = ply:Frags()

    local reactions = {
        [2] = function()
            print("two")
        end,
        [3] = function()
            print("three")
        end,
        [6] = function()
            print("six")
        end,
        [9] = function()
            print("nine")
        end
    }

    for k1, v1 in pairs(ply) do
        for k2, v2 in pairs(reactions) do
            if v1 == k2 then
                v2()
            end
        end
    end
end