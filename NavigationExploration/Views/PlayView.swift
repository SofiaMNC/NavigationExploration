//
//  PlayView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-06.
//

import SwiftUI

struct PlayView: View {
  @Binding var showFilter: Bool
  @Binding var showToolbar: Bool

  var body: some View {
    List {
      ZStack {
        LazyVStack {
          ForEach(0...100, id: \.self) { index in
            NavigationLink(value: "Song \(index)") {
              Label("Song \(index)", systemImage: "\(index).circle")
            }
          }
        }
        GeometryReader { proxy in
          let offset = proxy.frame(in: .named("scroll")).minY
          Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
        }
      }
    }
    .navigationDestination(for: String.self) { i in
      SongView()
    }
    .coordinateSpace(name: "scroll")
    .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
      print(value)
      withAnimation {
        if value < 350 {
          showFilter = false
        } else {
          showFilter = true
        }
      }
      
      withAnimation {
        if value < 350 {
          showToolbar = false
        } else {
          showToolbar = true
        }
      }
    }
  }
}


struct PlayView_Previews: PreviewProvider {
  struct Container: View {
    @State private var showFilter = true
    @State private var showToolbar = true

    var body: some View {
      PlayView(
        showFilter: $showFilter,
        showToolbar: $showToolbar
      )
    }
  }
  
  static var previews: some View {
      Container()
  }
}
