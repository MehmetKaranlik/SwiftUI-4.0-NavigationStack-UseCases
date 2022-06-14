
import SwiftUI

enum NavigationPaths: CaseIterable {
   case base
   case detail
   case detail2
   case tabDetail1
   case tabDetail2
   case tabDetail3
   case tabDetail4
   case tabDetail5
   case tabDetail6
   case tabDetail7
}

enum Routes {
   static let routes: [NavigationPaths: AnyView] = [
      .tabDetail1: AnyView(TabDetail1()),
      .tabDetail2: AnyView(TabDetail2()),
      .tabDetail3: AnyView(TabDetail3()),
      .tabDetail4: AnyView(TabDetail4()),
      .tabDetail5: AnyView(TabDetail5()),
      .tabDetail6: AnyView(TabDetail6()),
      .tabDetail7 : AnyView(TabDetail7())
   ]

   static func routerReturner(path: NavigationPaths) -> some View {
      let index = Routes.routes.index(forKey: path)!
      return Routes.routes[index].value
   }
}
