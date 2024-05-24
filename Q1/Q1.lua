-- Q1.lua
--
-- By Cameron Reid
-- Tavernlight Game Technical Test
-- Q1 - Fix or improve the implementation of the below methods

-- This file exposes a function called onLogout to the global Lua state and it utilizes
-- the local helper function releaseStorage. Since releaseStorage is a local function,
-- it is only callable inside of this file.

-- In order to improve readability of the code, I indented nested code and added comments
-- containing basic information about each function.

-- Since the definition of addEvent is inside of another file, I added a require statement
-- so that it is clear where the addEvent function is coming from. In addition, addEvent is
-- no longer polluting the global Lua state. Q1-addEvent can be added whereever addEvent is
-- needed
local eventBus = require("Q1-addEvent")
-- error checking functions are in another file for readability
local errorChecking = require("ErrorChecking") 

--- Removes the specified player's storage
-- @param   player  a reference to a player
local function releaseStorage(player)
    -- error checking to ensure that there is a valid table with a valid function
    if not errorChecking.isTable(player) then
        errorChecking.printError("releaseStorage", player)
        return
    elseif not errorChecking.isFunction(player, "setStorageValue") then
        errorChecking.printError("releaseStorage", player["setStorageValue"])
        return
    else
        player:setStorageValue(1000, -1)
    end
end

-- I created a stateManager class to contain the onLogout function to prevent
-- it from polluting the global Lua state
local stateManager = {}

--- Runs logout functionality for a player
-- @param   player   a reference to a player
-- @return  true     return value to let calling function know the call
--                   was successful
function stateManager.onLogout(player)
    -- error checking to ensure that there is a valid table with a valid function
    -- return false if there is an error since we are returning true otherwise
    if not errorChecking.isTable(player) then
        errorChecking.printError("onLogout", player)
        return false
    elseif not errorChecking.isFunction(player, "getStorageValue") then
        errorChecking.printError("onLogout", player["getStorageValue"])
        return false
    else
        if player:getStorageValue(1000) == 1 then
            eventBus.addEvent(releaseStorage, 1000, player)
        end
    end
    return true
end

-- The return reference to stateManager is added in case a reference to the
-- stateManager table is required inside of another file
return stateManager