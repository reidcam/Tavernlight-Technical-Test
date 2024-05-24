-- addEvent.lua
--
-- By Cameron Reid
-- Contains a potential file definition of the addEvent for Q1

-- eventBus is a local table so that the global Lua stat is not polluted
local eventBus = {}

-- This function is being created under the assumption that the
-- parameters for the addEvent function are a function, a time delay
-- in milliseconds before the function is called, and a player reference
function eventBus.addEvent(func, delay, player)
-- do something with the function, delay, and player ref
    print("Hello from addEvent!")
end

-- The return reference to eventBus is added in case a reference to the
-- eventBus table is required inside of another file
return eventBus