//
//  ReplaceSpace.swift
//  algorithm
//
//  Created by Gaoyang on 2021/10/27.
//

import Foundation

class ReplaceSpace {
    func replaceSpace(_ s: String) -> String {
        var ret = ""
        s.forEach { char in
            ret += char.isWhitespace ? "\(char)" : "%20"
        }
        return ret
    }
}
