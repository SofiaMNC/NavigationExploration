//
//  RoundedCornersButton.swift
//
//
//  Created by mwars on 2023-05-09.
//

import SwiftUI

// MARK: - RoundedCornersButton

/// Button with rounded corner shape
/// This button can contain both an image and a text element.
///
/// The text of this button will be displayed on one line only.
struct RoundedCornersButton: View {

  // MARK: - Lifecycle

  // MARK: Public

  init(
    icon: Image,
    text: String? = nil,
    borderColor: Color,
    hasTranslucentBackground: Bool = true,
    action: @escaping () -> Void
  ) {
    self.icon = icon
    self.text = text
    self.borderColor = borderColor
    self.hasTranslucentBackground = hasTranslucentBackground
    self.action = action
  }

  // MARK: - Properties

  // MARK: Internal

  let icon: Image
  let text: String?
  let borderColor: Color
  let hasTranslucentBackground: Bool
  let action: () -> Void

  var body: some View {
    if hasTranslucentBackground {
      Button(action: action) {
        HStack(spacing: 4) {
          if let text {
            Text(text)
          }
          icon
        }
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 5)
        .foregroundColor(.white)
        .clipShape(Capsule())
        .lineLimit(1)
        .font(.headline)
        .overlay(
          RoundedRectangle(cornerRadius: 48)
            .stroke(borderColor, style: StrokeStyle(lineWidth: 1))
        )
      }
    } else {
      Button(action: action) {
        HStack(spacing: 4) {
          if let text {
            Text(text)
          }
          icon
        }
        .padding([.leading, .trailing], 10)
        .padding([.top, .bottom], 5)
        .foregroundColor(.white)
        .background(.thinMaterial, in: Capsule())
        .clipShape(Capsule())
        .lineLimit(1)
        .font(.headline)
        .overlay(
          RoundedRectangle(cornerRadius: 48)
            .stroke(borderColor, style: StrokeStyle(lineWidth: 1))
        )
      }
    }
  }
}

// MARK: - RoundedCornersButton_Previews

struct RoundedCornersButton_Previews: PreviewProvider {
  static var previews: some View {
    RoundedCornersButton(
      icon: Image(systemName: "person"),
      borderColor: .gray,
      action: { }
    )
    .preferredColorScheme(.dark)
  }
}
