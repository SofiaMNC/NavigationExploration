//
//  PlayView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-06.
//

import SwiftUI

struct PlayView: View {
  @Binding var showFilter: Bool

  var body: some View {
    List {
      LazyVStack {
        ForEach(0...20, id: \.self) { index in
          NavigationLink(value: index) {
            Label("Song \(index)", systemImage: "\(index).circle")
          }
        }
      }
      .background {
        GeometryReader { proxy in
          EmptyView().onChange(of: proxy.frame(in: .global).minY) { newOffset in
            withAnimation {
              showFilter = newOffset >= 189
            }
          }
        }
      }
    }
    .navigationDestination(for: Int.self) { i in
      SongView(songId: i)
    }
  }
}


struct PlayView_Previews: PreviewProvider {
  struct Container: View {
    @State private var showFilter = true
    @State private var showToolbar = true

    var body: some View {
      PlayView(showFilter: $showFilter)
    }
  }
  
  static var previews: some View {
      Container()
  }
}
