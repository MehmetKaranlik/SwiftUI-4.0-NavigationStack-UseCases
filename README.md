# SwiftUI-4.0-NavigationStack-UseCases

Programmatic usage of SwiftUI's new coming Navigation Api -> NavigationStack


https://user-images.githubusercontent.com/89414084/173640037-c3725483-4db3-43f6-8e63-4f25e3330cb2.mov




Firstly we will need two enums to create our routes and paths<br>

````swift

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
````

Then we create our NavigationManager & its delegate(protocol) to handle our stack & routing 

````swift

protocol NavigationManagerDelegate {
   associatedtype Route = NavigationPaths
   func pushView(_ newView : Route)
   func popToRoot()
   func popUntil (_ targetRoute : Route)

}

class NavigationManager: ObservableObject, NavigationManagerDelegate {

   @Published var routes: [NavigationPaths] = []

   func pushView(_ newView: NavigationPaths) {
      routes.append(newView)
   }

   func popToRoot() {
      self.routes.removeAll()
   }
   
   func pop() {
      self.routes.removeLast()
   }

   func popUntil(_ targetRoute: NavigationPaths) {
      if self.routes.last != targetRoute {
         self.routes.removeLast()
         popUntil(targetRoute)
      }
   }
}

````
Then we create our custom view to provide manager to root view and pass environment object to view-hierarchy
This ensures less dependency by constructor. Note: #Only subviews(routed from parent view) can access that particular environment object.

Lastly we create extension on View to pass navigationDestination programmaticaly instead of using if else etc.

Note: routeIterator takes all possible routing cases for that particular hierarchy so we use it <strong>ONLY ON ROOTVIEW </strong> of that particular path.



````swift


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
   func routeIterator() -> some View {
      self.navigationDestination(for: NavigationPaths.self) { path in
         Routes.routerReturner(path: path)
      }
   }
}
````

On root view usage

````swift
struct TabDetail1: View {
   var body: some View {
      Navigator { manager in
         VStack {
            Text("1")
            Button("Go to 3") {
               manager.pushView(.tabDetail3)
            }
         }
         .routeIterator()
      }
   }
}
      
 ````
 
 Subview usage -> we reach to navigationManager from environment to get that stacks manager
 
 ````swift
 
 struct TabDetail3: View {
   @EnvironmentObject<NavigationManager> var navigationManager : NavigationManager
    var body: some View {
       VStack {
          Text("3")
          Button("Go to 5") {
             navigationManager.pushView(.tabDetail5)
          }
       }
    }
}

````

Notes: Each navigator comes in with built - in stack so it can be used in tabs with state preservation
 
 
 
      







