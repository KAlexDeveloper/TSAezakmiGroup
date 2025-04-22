//
//  ErrorHandler.swift
//  TSAezakmiGroup
//
//  Created by сонный on 22.04.2025.
//

import Foundation

struct ErrorHandler: LocalizedError, Equatable {
    
    enum ErrorType: Equatable {
        case invalidLoginOrPassword
        case missingEmailCharacter
        case minimumCharactersRequired
        case invalidInputOrResendCode
        case emptyInput
        case passwordConfig
    }
    
    let type: ErrorType
    
    var errorDescription: String? {
        switch type {
        case .invalidLoginOrPassword:
            return "Неверный логин или пароль"
        case .missingEmailCharacter:
            return "Не хватает знака @ или точки"
        case .minimumCharactersRequired:
            return "Пароль должен содержать минимум 8 символов"
        case .invalidInputOrResendCode:
            return "Проверьте правильность ввода или отправьте новый код"
        case .emptyInput:
            return "Заполните пустые поля"
        case .passwordConfig:
            return "Содержит цифру или символ"
        }
    }
    
    static func ==(lhs: ErrorHandler, rhs: ErrorHandler) -> Bool {
        return lhs.type == rhs.type
    }
}

extension ErrorHandler {
    static let invalidLoginOrPassword = ErrorHandler(type: .invalidLoginOrPassword)
    static let missingEmailCharacter = ErrorHandler(type: .missingEmailCharacter)
    static let minimumCharactersRequired = ErrorHandler(type: .minimumCharactersRequired)
    static let invalidInputOrResendCode = ErrorHandler(type: .invalidInputOrResendCode)
    static let emptyInput = ErrorHandler(type: .emptyInput)
    static let passwordConfig = ErrorHandler(type: .passwordConfig)
}
