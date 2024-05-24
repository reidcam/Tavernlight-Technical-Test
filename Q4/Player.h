// Player.h
//
// By Cameron Reid
// Tavernlight Game Technical Test
// Header file for the Player class so that I can get rid of the compiler
// errors in the Q4 file

//////////////////////////////////////////////////////////////////////////
// NOTE: The function declarations in this file are not meant to function.
//       They are to resolve compiler errors in Q4.cpp
//////////////////////////////////////////////////////////////////////////

// include gaurd so that this header file doesn't get included more than once
#ifndef PLAYER_H
#define PLAYER_H

#include <string>

#include "Item.h"

class Player {
private:
    Item* armor = nullptr;
public:
    Player(); // default constructor

    // constructor with the same parameters as the one in Q4
    Player(Item* armor_p) : armor(armor_p) {};

    // Gets the player's indox
    // @return  inbox  the player's inbox
    std::string getInbox();

    // Finds out if the player is currently offline
    // @return  true/false  returns true if the player is currently offline. True otherwise
    bool isOffline();

    // Gets a pointer to a player by using their name
    // @param   recipient   the name of the player to find
    // @return  Player*     a pointer to a player object
    Player* getPlayerByName(const std::string& recipient);

    // Adds an item to a player
    // @param   player_inbox    a reference to a player's inbox
    // @param   item            a pointer to the item to be added
    // @param   index           the index to add the item at
    // @param   flag            any flags to use
    void internalAddItem(const std::string& player_inbox, Item* item, int index, int flag);
};

#endif /* PLAYER_H */