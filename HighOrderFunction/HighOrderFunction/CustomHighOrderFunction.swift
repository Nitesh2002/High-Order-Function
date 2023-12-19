//
//  CustomHighOrderFunction.swift
//  HighOrderFunction
//
//  Created by Nitesh on 03/12/23.
//


import UIKit

final class CustomHighOrderFunction {
    
    init() {
        var list = [1,2,3,4]
        print(list.customMap(transform: {String($0)}))
        
        var compactMapList = ["1","2","nil","\\23"]
        print(compactMapList.customCompactMap(transform: {Int($0)}))
        
        var filterList = ["2", "4","1", "3"]
        print(filterList.customFilter(isIncluded: { Int($0)! % 2 == 0 }))
        
        var reduceList = ["5", "3", "11"]
        print(reduceList.customReduce(10,{ Int($0) + Int($1)!}))
        print(reduceList.reduce(10, { Int($0) + Int($1)! }))
    }
}

extension Array {
    
    func customMap<Transform>(transform:(Element) -> Transform) -> [Transform] {
        var result = [Transform]()
        forEach { element in
            result.append(transform(element))
        }
        return result
    }
    
    func customCompactMap<Transform>(transform:(Element) -> Transform?) -> [Transform] {
        var result = [Transform]()
        forEach { element in
            if let transform = transform(element) {
                result.append(transform)
            }
        }
        return result
    }
    
    func customFilter(isIncluded:(Element) -> Bool) -> [Element] {
        
        var result = [Element]()
        forEach { element in
            if isIncluded(element) {
                result.append(element)
            }
        }
        return result
    }
    
    func customReduce<Result>(_ initialResult: Result, _ nextPartialResult:(Result,Element)-> Result) -> Result {
        
        var result = initialResult
        
        forEach { element in
            result = nextPartialResult(result, element)
        }
        
        return result
        
    }
    
}
