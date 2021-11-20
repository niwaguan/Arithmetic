//
//  IsNumber.swift
//  algorithm
//
//  Created by Gaoyang on 2021/11/19.
//

import Foundation
// 判断字符串是否为数字
// https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
class IsNumber {
    
    typealias Transform = (InputType) -> State?
    
    static let transforms: [State: Transform] = [
        // 初始化状态，可以转向
        .initial: { input in
            switch input {
            case .blank:
                return .initial
            case .addsub:
                return .sign
            case .number:
                return .numberBeforeDot
            case .letter:
                return nil
            case .e:
                return nil
            case .dot:
                return .dotBeforeNumber
            }
        },
        .sign: { input in
            switch input {
            case .blank:
                return nil
            case .addsub:
                return nil
            case .number:
                return .numberBeforeDot
            case .letter:
                return nil
            case .e:
                return nil
            case .dot:
                return .dotBeforeNumber
            }
        },
        .numberBeforeDot: { input in
            switch input {
            case .blank:
                return .blank
            case .addsub:
                return nil
            case .number:
                return .numberBeforeDot
            case .letter:
                return nil
            case .dot:
                return .dotAfterNumber
            case .e:
                return .e
            }
        },
        .dotBeforeNumber: { input in
            switch input {
            case .blank:
                return nil
            case .addsub:
                return nil
            case .number:
                return .numberAfterDot
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return nil
            }
        },
        .dotAfterNumber: { input in
            switch input {
            case .blank:
                return .blank
            case .addsub:
                return nil
            case .number:
                return .numberAfterDot
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return .e
            }
        },
        .numberAfterDot: { input in
            switch input {
            case .blank:
                return .blank
            case .addsub:
                return nil
            case .number:
                return .numberAfterDot
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return .e
            }
        },
        .e: { input in
            switch input {
            case .blank:
                return nil
            case .addsub:
                return .esign
            case .number:
                return .enumber
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return nil
            }
        },
        .esign: { input in
            switch input {
            case .blank:
                return nil
            case .addsub:
                return nil
            case .number:
                return .enumber
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return nil
            }
        },
        .enumber: { input in
            switch input {
            case .blank:
                return .blank
            case .addsub:
                return nil
            case .number:
                return .enumber
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return nil
            }
        },
        .blank: { input in
            switch input {
            case .blank:
                return .blank
            case .addsub:
                return nil
            case .number:
                return nil
            case .letter:
                return nil
            case .dot:
                return nil
            case .e:
                return nil
            }
        },
    ]
    
    enum INError: Error {
        case invalidInput
        case invalidState
    }
    
    enum State {
        case initial, sign, numberBeforeDot, dotBeforeNumber, dotAfterNumber, numberAfterDot, e, esign, enumber, blank
        
        mutating func transform(by char: Character) throws {
            guard let input = InputType.from(char) else {
                throw INError.invalidInput
            }
            
            guard let transform = IsNumber.transforms[self] else {
                throw INError.invalidState
            }
            
            guard let next = transform(input) else {
                throw INError.invalidInput
            }
            
            self = next
        }
        
        static let acceptableState: [State] = [
            .dotAfterNumber, .numberBeforeDot, .numberAfterDot, .enumber, .blank
        ]
        var acceptable: Bool {
            return IsNumber.State.acceptableState.contains(self)
        }
    }
    
    enum InputType {
        case blank, number, addsub, letter, e, dot
        
        static let numbers = Array("0123456789")
        static func from(_ char: Character) -> Self? {
            if char == " " {
                return .blank
            } else if numbers.contains(char) {
                return .number
            } else if char == "+" || char == "-" {
                return .addsub
            } else if char == "e" || char == "E" {
                return .e
            } else if char == "." {
                return .dot
            }
            return nil
        }
    }
    
    func isNumber(_ s: String) -> Bool {
        var state: State = .initial
        for char in s {
            do {
               try state.transform(by: char)
            } catch {
                return false
            }
        }
        return state.acceptable
    }
}
