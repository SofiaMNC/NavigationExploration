//
//  ContentView.swift
//  DesignSystemDemo
//
//  Created by Sofia Chevrolat on 2023-04-06.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {

  // MARK: Internal
  @State private var navPath = NavigationPath()
  @State private var selection = Tab.places
  
  @State private var isCheckInSheetPresented: Bool = false
  @State private var isCheckedIn: Bool = false
  @State private var hasCheckedIn: Bool = false
  
  @State private var searchQuery = ""
  
  @State private var showUserAccount: Bool = false
  @State private var showCredits: Bool = false
  
  @State private var showFilter: Bool = true
  @State private var showToolbar: Bool = true

  var body: some View {
    NavigationStack(path: $navPath) {
      if selection == .play {
        TabView(selection: $selection) {
          
          // MARK: - Places View
          
          PlacesView(
            presentSheet: $isCheckInSheetPresented,
            hasCheckedIn: $hasCheckedIn
          )
          .fullScreenCover(isPresented: $hasCheckedIn) {
            InfoView(text: "WELCOME TO PLACE")
              .task {
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                selection = .play
                isCheckedIn = true
                hasCheckedIn = false
              }
          }
          .tabItem {
            Label(Tab.places.description, systemImage: "circle.grid.3x3.circle")
          }
          .tag(Tab.places)
          
          // MARK: - Play View
          
          PlayView(
            showFilter: $showFilter,
            showToolbar: $showToolbar
          )
          .tabItem {
            Label(Tab.play.description, systemImage: "flag.circle")
          }
          .tag(Tab.play)
        }
        
        // MARK: - User Account View
        
        .fullScreenCover(isPresented: $showUserAccount) {
          NavigationStack {
            InfoView(text: "User Account")
            .toolbar {
              TTToolbarContent(
                leadingView: CloseButton(),
                trailingView: CreditButton { }
              )
            }
          }
        }
        
        // MARK: - Credits  View
        
        .fullScreenCover(isPresented: $showCredits) {
          NavigationStack {
            InfoView(text: "Credits")
            .toolbar {
              TTToolbarContent(
                leadingView: CloseButton(),
                trailingView: CreditButton { }
              )
            }
          }
        }
        
        // MARK: - Toolbar
        
        .toolbar {
          if showToolbar {
            TTToolbarContent(
              leadingView: PlaceMenu(),
              trailingView: buttonGroup
            )
          }
        }
        
        // MARK: - Search Bar
        .searchable(
          text: $searchQuery,
          placement: .navigationBarDrawer(displayMode: .always)
        )
        
        // MARK: - Filter View
        
        .safeAreaInset(edge: .top) {
          if showFilter {
              FilterView()
              .transition(.move(edge: .top).combined(with: .opacity))
          }
        }
      } else {
        TabView(selection: $selection) {
          
          // MARK: - Places View
          
          PlacesView(
            presentSheet: $isCheckInSheetPresented,
            hasCheckedIn: $hasCheckedIn
          )
          .fullScreenCover(isPresented: $hasCheckedIn) {
            InfoView(text: "WELCOME TO PLACE")
              .task {
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                selection = .play
                isCheckedIn = true
                hasCheckedIn = false
              }
          }
          .tabItem {
            Label(Tab.places.description, systemImage: "circle.grid.3x3.circle")
          }
          .tag(Tab.places)
          
          // MARK: - Play View
          
          PlayView(
            showFilter: $showFilter,
            showToolbar: $showToolbar
          )
          .tabItem {
            Label(Tab.play.description, systemImage: "flag.circle")
          }
          .tag(Tab.play)
        }
        
        // MARK: - User Account View
        
        .fullScreenCover(isPresented: $showUserAccount) {
          NavigationStack {
            InfoView(text: "User Account")
            .toolbar {
              TTToolbarContent(
                leadingView: CloseButton(),
                trailingView: CreditButton { }
              )
            }
          }
        }
        
        // MARK: - Credits  View
        
        .fullScreenCover(isPresented: $showCredits) {
          NavigationStack {
            InfoView(text: "Credits")
            .toolbar {
              TTToolbarContent(
                leadingView: CloseButton(),
                trailingView: CreditButton { }
              )
            }
          }
        }
        
        // MARK: - Toolbar
        
        .toolbar {
          TTToolbarContent(
            leadingView: Button(isCheckedIn ? "Find a place" : "Check In") { isCheckInSheetPresented = true
            },
            trailingView: buttonGroup
          )
        }
      }
    }
  }

  private var buttonGroup: some View {
    HStack {
      UserButton {
        print("Setting showUserAccount")
        showUserAccount = true
        print("showUserAccount is now \(showUserAccount)")
      }
      CreditButton {
        showCredits = true
      }
    }
  }
  
  private enum Tab: Int, CustomStringConvertible {
    case places = 1
    case play = 2

    var description: String {
      switch self {
      case .places: return "Places"
      case .play: return "Play"
      }
    }
  }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
