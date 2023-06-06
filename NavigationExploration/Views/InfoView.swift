//
//  InfoView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-06.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.dismiss) private var dismiss

  let text: String
  let iconSystemName: String
  
  var body: some View {
    ZStack {
      Image(systemName: iconSystemName)
        .resizable()
        .scaledToFit()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      Text(text)
          .font(.title2)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(.ultraThinMaterial)
    }
    .background(.purple)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(text: "InfoView", iconSystemName: "music.note")
  }
}
