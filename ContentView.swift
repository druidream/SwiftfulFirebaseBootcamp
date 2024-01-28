//
//  ContentView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 12/25/23.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseAnalyticsSwift

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      AnalyticsView()
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
