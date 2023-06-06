//
//  FilterView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct FilterView: View {
  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        Button { } label: {
          HStack {
            Image(systemName: "wand.and.stars")
            Text("For You")
          }
        }
        Button { } label: {
          HStack {
            Image(systemName: "heart.fill")
            Text("Favorites")
          }
        }
        Button { } label: {
          HStack {
            Image(systemName: "clock.fill")
            Text("Recents")
          }
        }
        Button("Button") { }
        Button("Button") { }
        Button("Button") { }
      }
      .padding(.leading, 15)
      .buttonStyle(.bordered)
      .controlSize(.mini)
    }
  }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
