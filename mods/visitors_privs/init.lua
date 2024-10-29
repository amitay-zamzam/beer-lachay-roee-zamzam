-- Mod to revoke all interaction privileges from players
minetest.register_on_joinplayer(function(player)
    local pname = player:get_player_name()
    local privs = minetest.get_player_privs(pname)

    -- List of interaction-related privileges to revoke
    local privs_to_revoke = {"interact", "give", "place", "dig"}

    -- Revoke each privilege
    for _, priv in ipairs(privs_to_revoke) do
        privs[priv] = nil
    end

    minetest.set_player_privs(pname, privs)

    -- Notify the player that their interaction privileges have been revoked
    minetest.chat_send_player(pname, "Your interaction privileges have been revoked.")
end)
