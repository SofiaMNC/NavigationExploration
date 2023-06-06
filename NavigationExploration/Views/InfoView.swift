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
  
  var body: some View {
    VStack {
      Spacer()
      Text(text)
      Spacer()
    }
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(text: "InfoView")
  }
}
