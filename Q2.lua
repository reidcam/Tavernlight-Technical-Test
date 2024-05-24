-- Q2.lua
--
-- By Cameron Reid
-- Tavernlight Game Technical Test
-- Q2 - Fix or improve the implementation of the below method

-- selectGuildQuery seems to define a SQL query for gettting the name column from the guilds table
-- only selecting guilds with max_members that is less than memberCount. The query itself appears to
-- be vaild SQL

--- this method is supposed to print names of all guilds that have less than memberCount max members
-- @param   memberCount  The exclusive upper limit on members [0, memberCount)
function printSmallGuildNames(memberCount)
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"

    -- I moved the formatted query to its own variable so that it is easier to check
    -- if the query is formatted correctly if needed
    local formattedQuerry = string.format(selectGuildQuery, memberCount)

    -- Assuming that db.storeQuery runs the query and returns the results, resultId should store all of
    -- the results of the query. The code currently would only ever return the name of one guild that
    -- fits the query and not all of them. To fix this, we need to loop over all of the query results
    local resultId = db.storeQuery(formattedQuerry)

    -- Without knowing how the database functions, it is hard to write an accurate loop. Below is my
    -- best guess at how you could go about printing out all of the guild names from the result set

    -- make sure that resultId isn't nil
    if resultId then
        -- iterate over every row in the result set until there is no longer a valid row
        repeat
            local guildName = resultId.getString("name")
            print(guildName)
        until not resultId.next()
        -- clear the result set once we are done with it
        resultId.free()
    end

end