//
//  CreditButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct CreditButton: View {
  var borderColor: Color = .clear
  var hasTranslucentBackground: Bool = true
  let action: () -> Void
  
    var body: some View {
      RoundedCornersButton(
        icon: Image(systemName: "dollarsign.circle.fill"),
        text: "12",
        borderColor: borderColor,
        hasTranslucentBackground: hasTranslucentBackground,
        action: action
      )
    }
}

struct CreditButton_Previews: PreviewProvider {
    static var previews: some View {
      CreditButton(borderColor: .gray, action: {})
         .preferredColorScheme(.dark)
    }
}
