//
//  UserButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-09.
//

import SwiftUI

struct UserButton: View {
  let action: () -> Void

    var body: some View {
      RoundedCornersButton(icon: Image(systemName: "person"), action: action)
    }
}

struct UserButton_Previews: PreviewProvider {
    static var previews: some View {
      UserButton(action: {})
    }
}
