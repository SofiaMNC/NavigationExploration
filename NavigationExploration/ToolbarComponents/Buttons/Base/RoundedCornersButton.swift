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
    action: @escaping () -> Void
  ) {
    self.icon = icon
    self.text = text
    self.action = action
  }

  // MARK: - Properties

  // MARK: Internal

  let icon: Image
  let text: String?
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 4) {
        if let text {
          Text(text)
        }
        icon
      }
      .lineLimit(1)
      .font(.headline)
      .foregroundColor(.white)
      .padding(10)
      .overlay(
        RoundedRectangle(cornerRadius: 48)
          .stroke(.white, style: StrokeStyle(lineWidth: 1))
      )
    }
  }
}

// MARK: - RoundedCornersButton_Previews

struct RoundedCornersButton_Previews: PreviewProvider {
  static var previews: some View {
    RoundedCornersButton(
      icon: Image(systemName: "person"),
      action: { }
    )
    .preferredColorScheme(.dark)
  }
}
