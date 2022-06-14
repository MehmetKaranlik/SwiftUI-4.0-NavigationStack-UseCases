//
//  TabDetail1.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

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

struct TabDetail1_Previews: PreviewProvider {
   static var previews: some View {
      TabDetail1()
   }
}
