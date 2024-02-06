//
//  RootView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 2/2/24.
//

import SwiftUI

struct RootView: View {

  @State private var showSignInView: Bool = false

  var body: some View {
    ZStack {
      if !showSignInView {
        NavigationStack {
          SettingsView(showSignInView: $showSignInView)
        }
      }
    }
    .onAppear {
//      let authUser = try? AuthenticationManager.shared.getAu
    }
    .fullScreenCover(isPresented: $showSignInView) {
      NavigationStack {
        AuthenticationView(showSignInView: $showSignInView)
      }
    }
  }
}

#Preview {
    RootView()
}
