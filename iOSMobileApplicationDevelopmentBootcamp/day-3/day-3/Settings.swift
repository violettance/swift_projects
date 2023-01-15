//
//  settings.swift
//  day-3
//
//  Created by İrem Kurt on 7.01.2021.
//

import Foundation
// better Settings instead settings
class Settings {
        
        var name = ""
        var number = 0
    
    init() {
        
    }
        
        init( name:String, number:Int ) {
            self.name = name
            self.number = number
            
        }
    
    func call() {
        print("Data : ", name, " " , number)
    }
}


