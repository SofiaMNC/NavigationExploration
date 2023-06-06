//
//  TTToolbarContent.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-07.
//

import SwiftUI

struct TTToolbarContent<LeadingView: View, MiddleView: View, TrailingView: View>: ToolbarContent {
  let leadingView: LeadingView?
  let middleView: MiddleView?
  let trailingView: TrailingView?
  
  init(
    leadingView: LeadingView? = nil,
    middleView: MiddleView? = nil,
    trailingView: TrailingView? = nil
  ) {
    self.leadingView = leadingView
    self.middleView = middleView
    self.trailingView = trailingView
  }
  
  init(
    leadingView: LeadingView? = nil,
    middleView: MiddleView? = nil,
    trailingView: TrailingView? = nil
  ) where LeadingView == EmptyView {
    self.leadingView = leadingView
    self.middleView = middleView
    self.trailingView = trailingView
  }
  
  init(
    leadingView: LeadingView? = nil,
    middleView: MiddleView? = nil,
    trailingView: TrailingView? = nil
  ) where MiddleView == EmptyView {
    self.leadingView = leadingView
    self.middleView = middleView
    self.trailingView = trailingView
  }
  
  init(
    leadingView: LeadingView? = nil,
    middleView: MiddleView? = nil,
    trailingView: TrailingView? = nil
  ) where TrailingView == EmptyView {
    self.leadingView = leadingView
    self.middleView = middleView
    self.trailingView = trailingView
  }
  
  var body: some ToolbarContent {
    if let leadingView {
      ToolbarItemGroup(placement: .navigationBarLeading) {
        VStack {
          Spacer()
          leadingView
          Spacer(minLength: 15)
        }
      }
    }
    
    if let middleView {
      ToolbarItemGroup(placement: .principal) {
        VStack {
          Spacer()
          middleView
          Spacer(minLength: 15)
        }
      }
    }
    
    if let trailingView {
      ToolbarItemGroup(placement: .navigationBarTrailing) {
        VStack {
          Spacer()
          trailingView
          Spacer(minLength: 15)
        }
      }
    }
  }
}
