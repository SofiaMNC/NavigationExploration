//
//  SongView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-06.
//

import SwiftUI

struct SongView: View {
  let songId: Int
  @State private var largeImageScale = 1.0
  @State private var smallImageScale = 0.0
  
  var body: some View {
    ScrollView {
      ZStack {
        Image(systemName: "person.crop.artframe")
          .resizable()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .foregroundColor(.teal)
          .blur(radius: 20)

        VStack {
          Spacer(minLength: 150)
          Image(systemName: "person.crop.artframe")
            .resizable()
            .frame(width: 200, height: 200)
            .scaleEffect(largeImageScale)
          Spacer()
          ForEach(0...50, id: \.self) { index in
            HStack {
              VStack(alignment: .leading) {
                Text("Row \(index)")
                  .bold()
                Text("Subrow")
              }
              .padding(.leading, 30)
              Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
          }
        }
      }
      .background {
        GeometryReader { proxy in
          EmptyView().onChange(of: proxy.frame(in: .global).minY) { [oldOffset = proxy.frame(in: .global).minY] newOffset in
            withAnimation {
              if Int(newOffset) == 0 {
                largeImageScale = 1
              } else if newOffset < -250 {
                largeImageScale = 0
              } else {
                if oldOffset > newOffset { // scrolling up / going up
                  let newValue = largeImageScale - abs(newOffset / 5000)
                  largeImageScale = newValue < 0 ? 0 : newValue // shoud scale down
                } else { // scrolling down / going down
                  let newValue = largeImageScale + abs(newOffset / 5000)
                  largeImageScale = newValue > 1 ? 1 : newValue // should scale up
                }
              }
              smallImageScale = 1 - largeImageScale
            }
          }
        }
      }
    }
    .edgesIgnoringSafeArea(.top)
    .navigationBarBackButtonHidden()
    .toolbar {
      TTToolbarContent(
        leadingView: CloseButton(hasTranslucentBackground: false),
        middleView:
          Image(systemName: "person.crop.artframe")
            .resizable()
            .frame(width: 30, height: 30)
            .scaleEffect(smallImageScale)
        ,
        trailingView: CreditButton(hasTranslucentBackground: false) {}
      )
    }
  }
}

struct SongView_Previews: PreviewProvider {
  struct Container: View {
    let songId: Int = 1
    @State private var showImageInNavbar = false
    @State private var imageDimension: CGFloat = 200
    
    var body: some View {
      SongView(songId: songId)
    }
  }
  
  static var previews: some View {
    Container()
    .preferredColorScheme(.dark)
  }
}
