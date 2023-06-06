//
//  BackButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct BackButton: View {
  @Environment(\.dismiss) private var dismiss

    var body: some View {
      Button {
        dismiss()
      } label: {
        HStack {
          Image(systemName: "arrow.left")
            .foregroundColor(.white)
        }
      }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
