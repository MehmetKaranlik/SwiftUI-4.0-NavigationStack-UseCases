//
//  Navigator.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import Foundation
import SwiftUI

struct Navigator<Content: View>: View {
   let content: (NavigationManager) -> Content
   @StateObject var manager = NavigationManager()

   var body: some View {
      NavigationStack(path: $manager.routes) {
         content(manager)
      }
      .environmentObject(manager)
   }
}



extension View {
   func routeIterator(cases: [NavigationPaths]) -> some View {
      self.navigationDestination(for: NavigationPaths.self) { path in
         Routes.routerReturner(path: path)
      }
   }
}
