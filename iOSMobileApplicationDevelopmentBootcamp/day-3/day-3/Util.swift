//
//  Util.swift
//  day-3
//
//  Created by İrem Kurt on 7.01.2021.
//

import Foundation

class Util {
    
    var name = "Ali"
    
    func noParameter() {
        let num1 = 40
        let num2 = 80
        let sum = num1 + num2
        print("Sum : ", sum)
    }
    
    
    func parameter( num1:Int, num2:Int ) {
        let sum = num1 + num2
        print("Sum : ", sum)
        
    }
    
    func parameterReturn (num1:Int, num2:Int) -> Int {
        let sum = num1 + num2
        return sum
        
    }
    
    //only in Swift, Int and String can return in a same time
    func parameterReturns ( num1:Int, num2:Int ) -> (Int, String) {
        let sum = num1 + num2
        return (sum, "Ali")
        
}
    func stringConcat ( name: String, surname: String ) -> String {
        let st = "\(name) \(surname)"
        return st
    }
}
