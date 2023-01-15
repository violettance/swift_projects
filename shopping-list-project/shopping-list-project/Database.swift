//
//  Database.swift
//  shopping-list-project
//
//  Created by İrem Kurt on 24.01.2021.
//

import Foundation
import SQLite

class Database {
    
    var db:Connection!
    var items = Table("items")
    
    let id = Expression<Int64>("id")
    let food = Expression<String?>("food")
    let detail = Expression<String?>("detail")
    
    // make path for database
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    // 0 represents the best path of array
    
    func fncConnection() {
        
        // db object(check) - initilaze(check) - sqlite3file(check) -> access time
        let  dbPath = path + "/db.sqlite3"
        print("Full Path : \(dbPath)")
        db = try! Connection(dbPath)
        
        do {
            try db.scalar(items.exists)
        } catch  {
            try! db.run(items.create { t in
                t.column(id, primaryKey: true)
                t.column(food)
                t.column(detail)
            })
        }
    }
    
    func itemInsert(food: String, detail: String) -> Int64 {
        
        let insert = items.insert(self.food <- food, self.detail <- detail)
        return try! db.run(insert)
    }
    
    func itemList() -> [ItemSt] {
        var arr:[ItemSt] = []
        let itm = try! db.prepare(items)
        for item in itm {
            let x = ItemSt(id: item[id], food: item[food], detail: item[detail])
            arr.append(x)
        }
        return arr
    }
    
    func itemDelete( iid:Int64 ) -> Int {
        let alice = items.filter( id == iid )
        return try! db.run( alice.delete() )
    }
}
