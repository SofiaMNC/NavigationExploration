//
//  Menu.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct PlaceMenu: View {
    var body: some View {
      Menu {
        ForEach(1...3, id: \.self) { index in
          NavigationLink {
            InfoView(
              text: "Information View about Place \(index)",
              iconSystemName: "pin.circle"
            )
            .toolbarRole(.editor)
            .toolbar {
              TTToolbarContent(
                middleView: Text("Place \(index)").font(.title2),
                trailingView: CreditButton(borderColor: .gray) {})
            }
          } label: {
            Text("Show Place \(index)")
          }
        }
      } label: {
        HStack {
          Text("Places")
            .font(.title2)
          Image(systemName: "arrowtriangle.down.circle.fill")
        }
        .foregroundColor(.white)
      }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        PlaceMenu()
    }
}
