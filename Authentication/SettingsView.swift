//
//  SettingsView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 2/2/24.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {

  @Published var authProviders: [AuthProviderOption] = []

  func loadAuthProviders() {
    if let providers = try? AuthenticationManager.shared.getProvider() {
      authProviders = providers
    }
  }
}

struct SettingsView: View {

  @StateObject private var viewModel = SettingsViewModel()
  @Binding var showSignInView: Bool

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

//    if viewModel.authProviders.contains(.email) {
//      emailSection
//    }
  }
//    .onAppear {
//      viewModel.loadAuthProviders()
//    }
}

#Preview {
  SettingsView(showSignInView: .constant(true))
}
