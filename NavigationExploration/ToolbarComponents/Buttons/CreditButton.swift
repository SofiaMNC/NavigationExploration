//
//  CreditButton.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct CreditButton: View {
  let action: () -> Void
  
    var body: some View {
      RoundedCornersButton(
        icon: Image(systemName: "dollarsign.circle.fill"),
        text: "12",
        action: action
      )
    }
}

struct CreditButton_Previews: PreviewProvider {
    static var previews: some View {
      CreditButton(action: {})
         .preferredColorScheme(.dark)
    }
}
