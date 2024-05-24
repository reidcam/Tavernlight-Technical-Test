// IOLoginData.h
//
// By Cameron Reid
// Tavernlight Game Technical Test
// Header file for the IOLoginData class so that I can get rid of the compiler
// errors in the Q4 file

//////////////////////////////////////////////////////////////////////////
// NOTE: The function declarations in this file are not meant to function.
//       They are to resolve compiler errors in Q4.cpp
//////////////////////////////////////////////////////////////////////////

// include gaurd so that this header file doesn't get included more than once
#ifndef IOLOGINDATA_H
#define IOLOGINDATA_H

#include "Player.h"

class IOLoginData {
private:
public:
    /// Loads a specific player by using their name
    // @param   player      a pointer to a player object
    // @param   recipient   the name of the player to load
    // @return  true/false  returns true if the load was successful. False otherwise
    static bool loadPlayerByName(Player* player, const std::string& recipient);

    // Saves a player's data
    // @param   player  a pointer to a player object
    static void savePlayer(Player* player);
};

#endif /* IOLOGINDATA_H */