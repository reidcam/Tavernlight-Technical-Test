-- Q3.lua
--
-- By Cameron Reid
-- Tavernlight Game Technical Test
-- Q3 - Fix or improve the name and the implementation of the below method

-- This function appears to be a function that removes a player from a party.
-- There are several improvements that we can make to this function:
-- 1. indent nested code to improve readability
--
-- 2. player can become a local variable so that we don't pollute the global Lua state
--
-- 3. Since Lua is a weakly typed language, we can add error checking to make sure that
--    the variables that are getting passed in are what we expect them to be
--
-- 4. the membername variable is does not follow any code style, so I made the "N" capital
--    so that memberName is camelCase like playerId is
--
-- 5. "do_sth_with_PlayerParty" is not a very helpful function name and uses both snake_case
--    and camelCase for style. Since it appears that the function is meant to remove the specified
--    player from their party, the name should be something like "RemovePlayerFromParty." I am
--    styling the function name using camelCase because the other table member functions also
--    use camelCase for their function names
--
-- 6. As it is, the function is accessible from the global Lua state. In general, we want to avoid
--    polluting the global Lua state. In order to fix this, we can put it inside of a local table
--    that can be imported into other files where ever it may be needed. This also helps to make it
--    clear in other files where external functions are located.
--

local playerAPI = {}

--- Removes the player with the specified playerId and memberName from their party
-- @param   playerId    the id of the player to remove from their party
-- @param   memberName  the name of the player to remove from their party
function playerAPI.RemovePlayerFromParty(playerId, memberName)
    -- Assuming that playerId is supposed to be a number,
    -- we should make sure that it is a number
    if not type(playerId) == "number" then
        print("invalid playerId. playerId: " .. tostring(playerId))
        return
    end
    -- Assuming that memberName is supposed to be a string,
    -- we should make sure that it is a string
    if not type(memberName) == "string" then
        print("invalid memberName. memberName: " .. tostring(memberName))
        return
    end

    local player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(memberName) then
            party:removeMember(Player(memberName))
        end
    end
end

return playerAPI