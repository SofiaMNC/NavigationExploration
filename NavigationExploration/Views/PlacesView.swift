//
//  PlacesView.swift
//  NavigationExploration
//
//  Created by Sofia Chevrolat on 2023-06-09.
//

import MapKit
import SwiftUI

struct PlacesView: View {
  @Binding var presentSheet: Bool
  @Binding var hasCheckedIn: Bool
  
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 45.5088, longitude: -73.554),
    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
  )

  var body: some View {
    Map(
      coordinateRegion: $region,
      showsUserLocation: true,
      userTrackingMode: .constant(.follow)
    )
    .edgesIgnoringSafeArea(.top)
    .sheet(isPresented: $presentSheet) {
      List(1..<50) { i in
        Button("Place \(i)") {
          presentSheet = false
          hasCheckedIn = true
        }
      }
      .presentationDetents([.medium, .large])
    }
  }
}

struct PlacesView_Previews: PreviewProvider {
  struct Container: View {
    @State var presentSheet = true
    @State var hasCheckedIn = false
    
    var body: some View {
      PlacesView(presentSheet: $presentSheet, hasCheckedIn: $hasCheckedIn)
    }
  }
  
  static var previews: some View {
    Container()
  }
}
