//
//  AnalyticsView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 12/28/23.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseAnalyticsSwift

final class AnalyticsManager {
  static var shared = AnalyticsManager()
  private init() {}

  func logEvent(name: String, params: [String: Any]? = nil) {
    Analytics.logEvent(name, parameters: params)
  }

  func setUserId(userId: String) {
    Analytics.setUserID(userId)
  }

  func setUserProperty(value: String?, property: String) {
//    AnalyticsEventPurchase
    Analytics.setUserProperty(value, forName: property)
  }
}

struct AnalyticsView: View {
    var body: some View {
      VStack {
        Button("Click me!") {
          AnalyticsManager.shared.logEvent(name: "AnalyticsView_ButtonClick")
        }
        Button("Click me too!") {
          AnalyticsManager.shared.logEvent(name: "AnalyticsView_SecondaryButtonClick", params: ["screen_title" : "Hello, world!"])
        }
      }
      .analyticsScreen(name: "AnalyticsView")
      .onAppear {
        AnalyticsManager.shared.logEvent(name: "AnalyticsView_Appear")
      }
      .onDisappear {
        AnalyticsManager.shared.logEvent(name: "AnalyticsView_Disappear")
        AnalyticsManager.shared.setUserId(userId: "ABC123")
        AnalyticsManager.shared.setUserProperty(value: true.description, property: "user_is_premium")
      }
    }
}

#Preview {
    AnalyticsView()
}
