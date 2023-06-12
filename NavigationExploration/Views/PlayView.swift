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
        LazyVStack {
          ForEach(0...100, id: \.self) { index in
            NavigationLink(value: "Song \(index)") {
              Label("Song \(index)", systemImage: "\(index).circle")
            }
          }
        }.background {
          GeometryReader { proxy in
            EmptyView().onChange(of: proxy.frame(in: .global).minY) { newOffset in
              print(newOffset)
              if newOffset < 100 {
                withAnimation {
                  showFilter = false
                  showToolbar = false
                }
              } else {
                showFilter = true
                showToolbar = true
              }
            }
          }
        }
    }
    .navigationDestination(for: String.self) { i in
      SongView()
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
