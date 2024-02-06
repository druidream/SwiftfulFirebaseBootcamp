//
//  SwiftfulFirebaseBootcampApp.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 12/25/23.
//

import SwiftUI
import Firebase

@main
struct SwiftfulFirebaseBootcampApp: App {

  // without AppDelegate
  init() {
    FirebaseApp.configure()
    print("configured firebase")
  }

  var body: some Scene {
    WindowGroup {
      NavigationView {
        AuthenticationView(showSignInView: .constant(true))
      }
    }
  }
}

/*
// with AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
 */
