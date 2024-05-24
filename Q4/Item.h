// Item.h
//
// By Cameron Reid
// Tavernlight Game Technical Test
// Header file for the Item class so that I can get rid of the compiler
// errors in the Q4 file

//////////////////////////////////////////////////////////////////////////
// NOTE: The function declarations in this file are not meant to function.
//       They are to resolve compiler errors in Q4.cpp
//////////////////////////////////////////////////////////////////////////

// include gaurd so that this header file doesn't get included more than once
#ifndef ITEM_H
#define ITEM_H

class Item {
private:
    int itemId = -1;

    // Sets the id of the item
    // @param   new_itemId  the new id for the item
    inline void SetItemId(int new_itemId) { itemId = new_itemId; };
public:
    // Creates a new item and returns a pointer to it
    // @param   new_itemID  the id for the new item
    // @return  new_item    a pointer to a new item object
    inline static Item* CreateItem(int new_itemId) { 
        Item* new_item = new Item();
        new_item->SetItemId(new_itemId);
        return new_item;
    };
};

#endif /* ITEM_H */