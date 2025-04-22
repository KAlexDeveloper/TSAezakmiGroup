//
//  RegistrationView.swift
//  TSAezakmiGroup
//
//  Created by сонный on 22.04.2025.
//
import SwiftUI

struct RegistrationView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var registrationSuccess: Bool = false
    
    private let viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Регистрация")
                .font(.title)
                .fontWeight(.semibold)
            
            TextField("Введите почту", text: $login)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Введите пароль", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
            
            Button("Зарегистрироваться") {
                let result = viewModel.registerUser(login: login, password: password)
                registrationSuccess = result.success
                errorMessage = result.error
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(.horizontal)
            
            Button(action: {
                viewModel.loginWithTelegram()
            }) {
                HStack {
                    Image(systemName: "paperplane.fill")
                    Text("Log in with Telegram")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button("Уже есть аккаунт") {
                // Переход на логин экран
            }
            .foregroundColor(.blue)
        }
        .padding(.top)
    }
}
//#Preview {
//    RegistrationView()
//}
