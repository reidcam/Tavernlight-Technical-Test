// Q4.cpp
//
// By Cameron Reid
// Tavernlight Game Technical Test
// Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

//////////////////////////////////////////////////////////////////////////
// NOTE: I created header files for all of the classes in order to remove
//       all of the compiler warnings from the file
//////////////////////////////////////////////////////////////////////////

// includes for local files
#include "Game.h"
#include "IOLoginData.h"

// The memory leak is most likely the result of when a new player is created
// incorrectly. If "g_game.getPlayerByName(recipient);" fails to get a reference
// to the player, then player is likely nullptr. This would cause the following
// if statement to be true. "player = new Player(nullptr);" would then create a
// new player and assign it to the player variable. However, the player's data
// is then attempted to be loaded by name from, 
// "IOLoginData::loadPlayerByName(player, recipient)." 

// The loadPlayerByName function will assign the player it finds to the player
// variable. If this occurs, the new player object that was created by
// "player = new Player(nullptr);" will no longer be accessible, causing a memory leak.

// The memory leak can be resolved by only creating the new player object with
// "player = new Player(nullptr);" if 
// "IOLoginData::loadPlayerByName(player, recipient)" fails to load the player
// rather than returning out of the addItemToPlayer function.

// The other potential location for a memory leak is when the item is created
// using "Item* item = Item::CreateItem(itemId);." However, this likely is not
// the cause since by that point in the addItemToPlayer function there should
// be a valid player to add the item to whether or not the player originally
// existed

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    // First the function tries to get a pointer to the player.
    // If the player doesn't exist, a new player is made.
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            player = new Player(nullptr);
        }
    }

    // Next a new item is created so that it can be given to the player
    Item* item = Item::CreateItem(itemId);
    if (!item) {
        return;
    }

    // The item is then added to the player's inventory
    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    // If the player is offline, the player data is saved
    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}