/// Module: todo_list_move
module todo_list_move::todo_list_move;

use std::string::String;

public struct TodoList has key,store{
    id: UID,
    items:vector<String>,
}


public fun new(context: &mut TxContext):TodoList{
    let list = TodoList{
        id: object::new(context),
        items: vector[]
    };
    (list)
}

public fun add_item(list: &mut TodoList, item: String){
    list.items.push_back(item);
}

public fun remove_item(list: &mut TodoList, index: u64){
    list.items.remove(index);
}

// delete the list
public fun delete(list: TodoList){
    let TodoList{id, items:_} = list;
    id.delete();
}

public fun length(list: &TodoList): u64{
    list.items.length()
}