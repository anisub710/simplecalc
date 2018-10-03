//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var result:Int = 0
        let lastVal:Int? = Int(args[args.count - 1])
        if lastVal != nil {
            guard let val1 = Int(args[0]) else{
                return 0 //invalid values
            }
            guard let val2 = Int(args[2]) else {
                return 0 //invalid values
            }
            switch args[1]{
            case "+":
                result = val1 + val2
            case "-":
                result = val1 - val2
            case "/":
                result = val1 / val2
            case "%":
                result = val1 - (val1 / val2) * val2
            case "*":
                result = val1 * val2
            default:
                break
            }
        } else {
            let operation = args[args.count - 1]
            switch operation{
            case "count":
                result = args.count - 1
            case "avg":
                if args.count > 1 {
                    var sum = 0
                    for i in 0...args.count - 2 {
                        sum = sum + Int(args[i])!
                    }
                    result = sum / (args.count - 1)
                }
            case "fact":
                guard let num = Int(args[0]) else{
                    return 0
                }
                if num == 0 {
                    return 1
                    
                }else if num < 0 {
                    return 0 // negative factorials don't exist
                }
                result = 1
                for i in 1...num {
                    result = i * result
                }
            default:
                break
            }
        }
        return result
    }
    public func calculate(_ arg: String) -> Int {
//        var splitArgs:[String] = arg.split(separator: " ").map({ substr in String(substr) })
//        splitArgs.removeFirst(1)
//        return calculate( splitArgs )
        return calculate(arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

