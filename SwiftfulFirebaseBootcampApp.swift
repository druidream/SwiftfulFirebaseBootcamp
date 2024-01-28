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

  init() {
    FirebaseApp.configure()
    print("configured firebase")
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
