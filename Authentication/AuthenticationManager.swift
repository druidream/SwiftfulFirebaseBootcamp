//
//  AuthenticationManager.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 1/30/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
  let uid: String
  let email: String?
  let photoUrl: String?

  init(user: FirebaseAuth.User) {
    self.uid = user.uid
    self.email = user.email
    self.photoUrl = user.photoURL?.absoluteString
  }
}

enum AuthProviderOption: String {
  case email = "password"
  case google = "google.com"
}

// MARK: SIGN IN EMAIL

final class AuthenticationManager {

  static let shared = AuthenticationManager()
  private init() {}

//  func createUser(email: String, password: String) async throws {
//    let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
//    authDataResult.user.email
//    return AuthDataResultModel(user: user)
//  }

  // google.com
  func getProvider() throws -> [AuthProviderOption] {
    guard let providerData = Auth.auth().currentUser?.providerData else {
      throw URLError(.badServerResponse)
    }

    var providers: [AuthProviderOption] = []
    for provider in providerData {
      if let option = AuthProviderOption(rawValue: provider.providerID) {
        providers.append(option)
      } else {
        assertionFailure("Provider option not found: \(provider.providerID)")
      }
    }
    return providers
  }

  func signOut() throws {
    try Auth.auth().signOut()
  }
}

// MARK: SIGN IN SSO

extension AuthenticationManager {

  @discardableResult
  func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
    let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
    return try await signIn(credential: credential)
  }

  func signIn(credential: AuthCredential) async throws -> AuthDataResultModel {
    let authDataResult = try await Auth.auth().signIn(with: credential)
    return AuthDataResultModel(user: authDataResult.user)
  }
}
