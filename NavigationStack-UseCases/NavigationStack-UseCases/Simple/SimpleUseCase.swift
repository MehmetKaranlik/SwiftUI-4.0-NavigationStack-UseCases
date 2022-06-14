//
//  ContentView.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct SimpleUseCase: View {

    var body: some View {
       Navigator { manager in
          Text("base")
             .onTapGesture {
                manager.routes.append(NavigationPaths.detail)
             }
             .navigationDestination(for: NavigationPaths.self) { path in

             }


       }


    }
}

struct DetailView : View {
   @EnvironmentObject var navigationManager: NavigationManager
   var body: some View {
         Text("page2")
         .onTapGesture {
            navigationManager.routes.append(NavigationPaths.detail2)
         }
         .navigationDestination(for: NavigationPaths.self) { _ in
            DetailView2()
         }
   }
}


struct DetailView2 : View {
   @EnvironmentObject var navigationManager: NavigationManager

   var body: some View {
      Text("Page3")
         .onTapGesture {

         }
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleUseCase()
    }
}
