//
//  BinarySearch.swift
//  Practice
//
//  Created by Lance Jabr on 6/11/18.
//  Copyright © 2018 Lance Jabr. All rights reserved.
//

import Foundation
/*
 */
func binarySearch<T: Comparable>(_ list: [T],
                                 value: T,
                                 range: Range<Array<T>.Index>? = nil) -> Int? {
    
    let lowBound = range?.lowerBound ?? 0
    let highBound = (range?.upperBound ?? list.count) - 1
    
    if lowBound > highBound { return nil }
    
    let midBound = (lowBound + highBound) / 2
    
    if value == list[midBound] { return midBound }
    
    if value > list[midBound] { return binarySearch(list, value: value, range: midBound + 1..<highBound+1) }
    
    if value < list[midBound] { return binarySearch(list, value: value, range: lowBound..<midBound) }
    
    return nil
}

func testBinarySearch() {
    let l = [2,3,4,5,6,24,25,345,23452346,43533452345234]
    assert(binarySearch(l, value: 24) == l.index(where: { $0 == 24 }))
    assert(binarySearch(l, value: 5) == l.index(where: { $0 == 5 }))
    assert(binarySearch(l, value: 1) == l.index(where: { $0 == 1 }))
    assert(binarySearch(l, value: 2) == l.index(where: { $0 == 2 }))
    assert(binarySearch(l, value: 43533452345234) == l.index(where: { $0 == 43533452345234 }))
    assert(binarySearch(l, value: 435334523452444) == l.index(where: { $0 == 435334523452444 }))
}


