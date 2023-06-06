//
//  SongView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-06.
//

import SwiftUI

// Preference that observes a CGFloat.
struct ScrollViewOffsetPreferenceKey: PreferenceKey {
  static var defaultValue = CGFloat.zero

  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value += nextValue()
  }
}

struct SongView: View {
  @State private var showImageInNavbar = false
  @State private var imageDimension: CGFloat = 200
  
  var body: some View {
    ScrollView {
      ZStack {
        LazyVStack {
          Image(systemName: "person.crop.artframe")
            .resizable()
            .frame(width: imageDimension, height: imageDimension)
          Spacer()
          ForEach(0...100, id: \.self) { index in
              Text("Row \(index)")
          }
        }
        GeometryReader { proxy in
          let offset = proxy.frame(in: .named("scroll")).minY
          Color.clear.preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
        }
      }
    }
    .coordinateSpace(name: "scroll")
    .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
      print(value)
      
      if value < 0 {
        imageDimension = max(0, imageDimension + value / 2)
      } else {
        imageDimension = min(imageDimension + value / 2, 200)
      }
      
      if imageDimension == 0 {
        showImageInNavbar = true
      } else {
        showImageInNavbar = false
      }
    }
    .navigationBarBackButtonHidden()
    .toolbar {
      TTToolbarContent(
        leadingView: CloseButton(),
        middleView: showImageInNavbar ?
          Image(systemName: "person.crop.artframe")
            .resizable()
            .frame(width: 30, height: 30)
        : nil,
        trailingView: CreditButton {}
      )
    }
  }
}

struct SongView_Previews: PreviewProvider {
    static var previews: some View {
      HStack {
        SongView()
      }
      .preferredColorScheme(.dark)
    }
}
