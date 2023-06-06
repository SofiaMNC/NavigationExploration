//
//  CloseButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct CloseButton: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    RoundedCornersButton(icon: Image(systemName: "xmark")) {
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
