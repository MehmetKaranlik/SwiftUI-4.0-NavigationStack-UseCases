//
//  TabCase.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct TabCase: View {
@State var tabSelection = 0
   var body: some View {
      TabView {
         TabDetail1()
            .tabItem({
               Label("1", image: "person")
                  .font(.headline)
            })
            .tag(0)
         TabDetail2()
            .tabItem({
               Label("2", image: "person")
                  .font(.headline)
            })
            .tag(1)
      }
   }
}

struct TabCase_Previews: PreviewProvider {
    static var previews: some View {
        TabCase()
    }
}
