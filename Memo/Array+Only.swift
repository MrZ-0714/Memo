//
//  Array+Only.swift
//  Memo
//
//  Created by Zimo Zhao on 5/3/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
