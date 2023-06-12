//
//  SongView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-06.
//

import SwiftUI

struct SongView: View {
  @State private var showImageInNavbar = false
  @State private var imageDimension: CGFloat = 200
  
  var body: some View {
    ScrollView {
        VStack {
          Image(systemName: "person.crop.artframe")
            .resizable()
            .frame(width: imageDimension, height: imageDimension)
          Spacer()
          ForEach(0...100, id: \.self) { index in
            HStack {
              Spacer()
              Text("Row \(index)")
              Spacer()
            }
          }
        }.background {
          GeometryReader { proxy in
            EmptyView().onChange(of: proxy.frame(in: .named("scroll")).minY) { newOffset in
              if newOffset < 0 {
                imageDimension = max(0, imageDimension + newOffset / 2)
              } else {
                imageDimension = min(imageDimension + newOffset / 2, 200)
              }

              if imageDimension == 0 {
                showImageInNavbar = true
              } else {
                showImageInNavbar = false
              }
            }
          }
        }
    }
    .coordinateSpace(name: "scroll")
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
