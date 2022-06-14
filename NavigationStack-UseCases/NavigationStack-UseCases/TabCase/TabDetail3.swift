//
//  TabDetail3.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

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

struct TabDetail3_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail3()
    }
}
