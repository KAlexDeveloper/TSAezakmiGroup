//
//  RegistrationViewModel.swift
//  TSAezakmiGroup
//
//  Created by сонный on 22.04.2025.
//

import Foundation

final class RegistrationViewModel {
    
    func registerUser(login: String, password: String) -> (success: Bool, error: String?) {
        guard !login.isEmpty else {
            return (false, "Введите логин")
        }
        
        guard !password.isEmpty else {
            return (false, "Введите пароль")
        }
        
        let user = User(login: login, password: password)
        print("Пользователь зарегистрирован: \(user.login)")
        
        return (true, nil)
    }
    
    func loginWithTelegram() {
        print("Вход через Telegram")
    }
}
