import SwiftUI

class NavigationManager: ObservableObject, NavigationManagerDelegate {

   @Published var routes: [NavigationPaths] = []

   func pushView(_ newView: NavigationPaths) {
      routes.append(newView)
   }

   func popToRoot() {
      self.routes.removeAll()
   }

   func popUntil(_ targetRoute: NavigationPaths) {
      if self.routes.last != targetRoute {
         self.routes.removeLast()
         popUntil(targetRoute)
      }
   }
}
