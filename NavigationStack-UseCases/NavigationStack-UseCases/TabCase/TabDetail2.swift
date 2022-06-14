//
//  TabDetail2.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct TabDetail2: View {
    var body: some View {
       Navigator { manager in
          VStack {
             Text("2")
             Button("Go to 4") {
                manager.pushView(.tabDetail4)
             }
          }
          .routeIterator(cases: NavigationPaths.allCases)
       }

    }
}

struct TabDetail2_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail2()
    }
}
