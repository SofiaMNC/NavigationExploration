//
//  RoundButton.swift
//
//
//  Created by Sofia Chevrolat on 2023-06-12.
//

import SwiftUI

// MARK: - RoundImageButton

struct RoundImageButton: View {

  // MARK: - Lifecycle

  // MARK: Public

  init(
    icon: Image,
    borderColor: Color,
    hasTranslucentBackground: Bool = true,
    action: @escaping () -> Void
  ) {
    self.icon = icon
    self.borderColor = borderColor
    self.hasTranslucentBackground = hasTranslucentBackground
    self.action = action
  }

  // MARK: - Properties

  // MARK: Internal

  let icon: Image
  let borderColor: Color
  let hasTranslucentBackground: Bool
  let action: () -> Void

  var body: some View {
    if hasTranslucentBackground {
      Button(action: action) {
        icon
          .padding(10)
          .foregroundColor(.white)
          .clipShape(Capsule())
          .font(.caption)
          .bold()
          .overlay(
            RoundedRectangle(cornerRadius: 48)
              .stroke(borderColor, style: StrokeStyle(lineWidth: 1))
          )
      }
    } else {
      Button(action: action) {
        icon
          .padding(10)
          .foregroundColor(.white)
          .background(.thinMaterial, in: Capsule())
          .clipShape(Capsule())
          .font(.caption)
          .bold()
          .overlay(
            RoundedRectangle(cornerRadius: 48)
              .stroke(borderColor, style: StrokeStyle(lineWidth: 1))
          )
      }
    }
  }
}

// MARK: - RoundedCornersButton_Previews

struct RoundImageButton_Previews: PreviewProvider {
  static var previews: some View {
    RoundedCornersButton(
      icon: Image(systemName: "person"),
      borderColor: .gray,
      action: { }
    )
    .preferredColorScheme(.dark)
  }
}
