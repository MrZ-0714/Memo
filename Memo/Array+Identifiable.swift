//
//  Array+Identifiable.swift
//  Memo
//
//  Created by Zimo Zhao on 4/29/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return 0 //TODO: bogus!
    }
}
