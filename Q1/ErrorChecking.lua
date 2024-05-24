-- ErrorChecking.lua
--
-- By Cameron Reid
-- Contains error checking functions

local errorChecking = {}

--- Checks to see if the specified table is a valid table
-- @param   table       variable to check to see if it is a table
-- @return  true/false  returns true if table is a valid table. False otherwise
function errorChecking.isTable(table)
    if type(table) == "table" then
        return true
    end
    return false
end

--- Checks to see if the provided table has a function with the provided name
-- @param   table           table to check for the function
-- @param   functionName    name of the function to check for
-- @return  true/false      returns true if functionName is a valid function of table.
--                          False otherwise
function errorChecking.isFunction(table, functionName)
    if isTable(table) then
        if type(table[functionName]) == "function" then
            return true
        end
    end
    return false
end

--- Prints out an error message with information about the function that called it
--  and the parameter that caused the error
-- @param   functionName    the name of the function that caused the error
-- @param   parameter       the parameter that caused the error
function errorChecking.printError(functionName, parameter)
    print("error: location - " .. tostring(functionName) .. " | parameter - " .. tostring(parameter))
end

return errorChecking