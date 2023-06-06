//
//  CloseButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct CloseButton: View {
  @Environment(\.dismiss) private var dismiss
  
  var borderColor: Color = .clear
  var hasTranslucentBackground: Bool = true
  
  var body: some View {
    RoundImageButton(
      icon: Image(systemName: "xmark"),
      borderColor: borderColor,
      hasTranslucentBackground: hasTranslucentBackground
    ) {
      dismiss()
    }
  }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
      CloseButton()
        .preferredColorScheme(.dark)
    }
}
