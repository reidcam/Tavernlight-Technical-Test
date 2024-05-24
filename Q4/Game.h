// Game.h
//
// By Cameron Reid
// Tavernlight Game Technical Test
// Header file for the Game class so that I can get rid of the compiler
// errors in the Q4 file

//////////////////////////////////////////////////////////////////////////
// NOTE: The function declarations in this file are not meant to function.
//       They are to resolve compiler errors in Q4.cpp
//////////////////////////////////////////////////////////////////////////

// include gaurd so that this header file doesn't get included more than once
#ifndef GAME_H
#define GAME_H

// standard library includes
#include <string>

#include "Player.h"

class Game {
private:
    const int INDEX_WHEREEVER = 0;
    const int FLAG_NOLIMIT = -1;
public:
    Player g_game;

    // Adds an item to a player
    // @param   recipient   the name of the player to recieve the item
    // @param   itemId      the id of the item to add to the player
    void addItemToPlayer(const std::string& recipient, uint16_t itemId);
};

#endif /* GAME_H */