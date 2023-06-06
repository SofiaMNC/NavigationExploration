//
//  UserButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-09.
//

import SwiftUI

struct UserButton: View {
  var borderColor: Color = .clear
  var hasTranslucentBackground: Bool = true
  let action: () -> Void

    var body: some View {
      RoundImageButton(
        icon: Image(systemName: "person"),
        borderColor: borderColor,
        hasTranslucentBackground: hasTranslucentBackground,
        action: action
      )
    }
}

struct UserButton_Previews: PreviewProvider {
    static var previews: some View {
      UserButton(borderColor: .gray, action: {})
    }
}
