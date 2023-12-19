//
//  HighOrderFunction.swift
//  HighOrderFunction
//
//  Created by Nitesh on 03/12/23.
//

import Foundation

final class HighOrderFunction {
    
    private let testInputList = [8,1,2,4,-1,7]
    private let testInputNilList = [8,1,2,4,-1,7,nil]
    private let testInputEmptyList = ["7",""]
    private let possibleNumbers = ["1", "2", "three", "///4///", "5", "a7"]
    
    @discardableResult
    init() {
        //sort()
        //map()
        //compactmap()
        //flatmap()
        //filter()
        //reduce()
        //foreach()
        split()
    }
}

extension HighOrderFunction {
    
    private func sort() {
        let result = testInputList.sorted(by: > )
        print(result) //[-1, 1, 2, 4, 7, 8]
        
        let descendingResult = testInputList.sorted(by: { $0 > $1})
        print(descendingResult) //[8, 7, 4, 2, 1, -1]
        
        let ascendingResult = testInputList.sorted(by: { $0 < $1})
        print(ascendingResult) //[-1, 1, 2, 4, 7, 8]
        
        let otherSortResult = testInputList.sorted { a, b in
            return a % 2 == 0
        }
        print(otherSortResult) //[0, 0,0, 0, 1, 0]
    }
    
    private func map() {
        let result = testInputList.map({"\($0)"})
        print(result) //["8","1","2","4","-1","7"]
        
        let nilmapResult = testInputNilList.map({"\($0 ?? 0)"})
        print(nilmapResult) //["8", "1", "2", "4", "-1", "7", "0"]
        
        let compactmapResultEmptyString = testInputEmptyList.map({$0})
        print(compactmapResultEmptyString) //["7", ""]
        
        
        let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
        print(mapped)    // [1, 2, nil, nil, 5]
        // Needs a default value if element are not optional or force unwrapping
        
        var info = [String: String]()
        info["name"] = "andrew"
        info["city"] = "berlin"
        info["job"] = "developer"
        info["hobby"] = "computer games"
        
        let testmapvalues = info.mapValues({$0.uppercased()})
        print(testmapvalues)
        //["job": "DEVELOPER", "hobby": "COMPUTER GAMES", "city": "BERLIN", "name": "ANDREW"]
        
        let test = info.map({$0.value.uppercased()})
        print(test)
        //["DEVELOPER", "COMPUTER GAMES", "BERLIN", "ANDREW"]
    }
    
    private func compactmap() {
        let compactmapResult = testInputNilList.compactMap({"\($0 ?? 0)"})
        print(compactmapResult)  //No change ["8", "1", "2", "4", "-1", "7", "0"]
        
        let compactmapResultNoTransform = testInputNilList.compactMap({$0})
        print(compactmapResultNoTransform) //[8, 1, 2, 4, -1, 7]
        
        let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
        print(compactMapped)     // [1, 2, 5]
        // Doesnlt need a default value if element are not optional
    }
    
    private func flatmap() {
        let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]
        let markswithnil = [[3, 4, 5,nil], [2, 5, 3], [1, 2, 2,nil], [5, 5, 4], [3, 5, 3]]
        
        print(marks.flatMap({$0})) // [3, 4, 5, 2, 5, 3, 1, 2, 2, 5, 5, 4, 3, 5, 3]
        print(markswithnil.flatMap({$0})) // [Optional(3), Optional(4), Optional(5), nil, Optional(2), Optional(5), Optional(3), Optional(1), Optional(2), Optional(2), nil, Optional(5), Optional(5), Optional(4), Optional(3), Optional(5), Optional(3)]
        print(markswithnil.flatMap({$0.compactMap({$0})})) // [3, 4, 5, 2, 5, 3, 1, 2, 2, 5, 5, 4, 3, 5, 3]
    }
    
    private func filter() {
        let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
        let result = numbers.filter { (number) -> Bool in
            return number > 10
        }
        print(result) // [15, 12, 17, 20, 11]
        
        let numberswithnil = [2, 5, nil, 9, 15, 12, 8, nil, 20, 11]
        let nilresult = numberswithnil.filter { (number) -> Bool in
            //return number ?? 8 > 10  // [Optional(15), Optional(12), Optional(20), Optional(11)]
            return number ?? 20 > 10
        }
        print(nilresult)// [nil, Optional(15), Optional(12), nil, Optional(20), Optional(11)]
        print(nilresult.compactMap({$0})) //[15, 12, 17, 20, 11]
    }
    
    private func reduce() {
        let numbers = [5, 3, 8, 4, 2]
        let result = numbers.reduce(10) { $0 + $1 }
        //let result = numbers.reduce(7/2,{ $0 + $1 })
        print(result) // 32 (10 + (sum of elements in the list))
        
    }
    
    private func foreach() {
        let numbers = [5, 3, 8, 4, 2]
        numbers.forEach({$0.isMultiple(of: 4) ? print("yes\($0)") : print("no\($0)")}) // no5 no3 yes8 yes4 no2
        
        numbers.forEach({ numbers.firstIndex(of: $0) == 1 ? print("element at first index = \($0)") : print("\($0)") }) // 5 element at first index = 3 8 4 2
        
        // for in is a loop where foreach is a function
        // hence break and continue are not allowed in foreach
        //--------
        //        numbers.forEach { number in
        //            if number/2 == 0 {
        //                break // Unlabeled 'break' is only allowed inside a loop or switch, a labeled break is required to exit an if or do
        //                continue // 'continue' is only allowed inside a loop
        //            }
        //        }
        //---------
    }
    
    private func split() {
        let anotherMessage = "This message is going to be    broken in pieces!"
        print(anotherMessage.split{ $0 == " "}) // ["This", "message", "is", "going", "to", "be", "broken", "in", "pieces!"]
        let splitOnce = anotherMessage.split(maxSplits: 1, whereSeparator: { $0 == " " })
        print(splitOnce) // ["This", "message is going to be    broken in pieces!"]
        print(anotherMessage.split(omittingEmptySubsequences: false, whereSeparator: { $0 == " " })) //["This", "message", "is", "going", "to", "be", "", "", "", "broken", "in", "pieces!"]
        
        let multiCharMessage = "This message. is going? to be?    broken in pieces!"
        print(multiCharMessage.split{ $0 == "."
            || $0 == "?" }) //["This", "message", "is", "going", "to", "be", "", "", "", "broken", "in", "pieces!"]
        
        
    }
}

/* First order funtion
 
 - Can be stored in variables
 - Can be returned from a function.
 - Can be passed as arguments into another function.
 
 */

/* High order funtion
 
 - Takes one or more functions as an argument
 - Returns the functions as a result
 
 // All functions are first class functions
 // HO function can be applied over collections(array, sets, dictionaries)
 // HO are syncronous as it uses non-escaping closers
 // Not thread safe
 // $0 is called as short hand argument
 
 -----Types----
 - map
 - compactMap
 - flatMap
 - filter
 - reduce
 - forEach
 - contains
 - removeAll
 - sorted
 - split
 -------------
 */
