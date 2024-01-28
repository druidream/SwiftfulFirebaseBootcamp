//
//  UnlockAnimationView.swift
//  SwiftfulFirebaseBootcamp
//
//  Created by Jun Gu on 12/26/23.
//

import SwiftUI

struct UnlockAnimationView: View {
  @State var unlocked = false
    var body: some View {
      Image(systemName: unlocked ? "lock.open" : "lock")
        .font(.system(size: 100))
//        .rotationEffect(.degrees(unlocked ? 90 : 0))
        .onTapGesture {
          withAnimation {
            self.unlocked.toggle()
          }
        }
    }
}

#Preview {
    UnlockAnimationView()
}
