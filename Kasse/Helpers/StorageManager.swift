//
//  StorageManager.swift
//  Vinishko
//
//  Created by Денис on 01.10.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ record: RecordModel) {
        try! realm.write {
            realm.add(record)
        }
    }
    
    static func deleteObject(_ record: RecordModel) {
        try! realm.write {
            realm.delete(record)
        }
    }
    
}
