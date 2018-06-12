//
//  Quicksort.swift
//  Practice
//
//  Created by Lance Jabr on 6/11/18.
//  Copyright © 2018 Lance Jabr. All rights reserved.
//

import Foundation

func quicksort<T: Comparable>( _ list: inout [T], range: Range<Int>?=nil) {
    
    let range = range ?? 0..<list.count

    if range.upperBound - range.lowerBound <= 1 { return }
    
    let pivot = list[range.upperBound - 1]
    var upper = range.upperBound - 2
    var lower = range.lowerBound
    
    while(true) {
        while lower < upper && list[lower] <= pivot { lower += 1 }
        while lower < upper && list[upper] >= pivot { upper -= 1 }
        
        if lower == upper { break }
        
        list.swapAt(lower, upper)
    }
    
    assert(lower == upper)
    
    let pivotI = list[lower] > pivot ? lower : lower + 1
    list.swapAt(pivotI, range.upperBound - 1)
    
    quicksort(&list, range: range.lowerBound..<pivotI)
    quicksort(&list, range: pivotI+1..<range.upperBound)
}

func testQuicksort() {
    var l = Array<Int>(repeating: 1, count: 10).map() { $0 * Int(arc4random_uniform(10)) }
    print(l)
    quicksort(&l)
    print(l)
}
