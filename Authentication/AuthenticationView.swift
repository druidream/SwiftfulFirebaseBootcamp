//
//  AuthenticationView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 1/30/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class AuthenticationViewModel: ObservableObject {

  func signInGoogle() async throws {
    let helper = SignInGoogleHelper()
    let tokens = try await helper.signIn()
    try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
  }
}

struct AuthenticationView: View {

  @StateObject private var viewModel = AuthenticationViewModel()
  @Binding var showSignInView: Bool

  var body: some View {
    VStack {
      NavigationLink {
        Text("Hello")
      } label: {
        Text("Sign In With Email")
          .font(.headline)
          .foregroundStyle(.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(.blue)
          .cornerRadius(10)
      }

      GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
        Task {
          do {
            try await viewModel.signInGoogle()
            showSignInView = false
          } catch {
            print(error)
          }
        }
      }

      Spacer()
    }
    .padding()
    .navigationTitle("Sign In")
  }
}

#Preview {
  NavigationStack {
    AuthenticationView(showSignInView: .constant(false))
  }
}
