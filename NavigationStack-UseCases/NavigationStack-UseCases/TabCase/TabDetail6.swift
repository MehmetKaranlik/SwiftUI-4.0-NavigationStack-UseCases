//
//  TabDetail6.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct TabDetail6: View {
   @EnvironmentObject var navigationManager : NavigationManager

    var body: some View {
       VStack {
          Text("6")
          Button("Go to 7") {
             navigationManager.pushView(.tabDetail7)
          }
       }

    }
}

struct TabDetail6_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail6()
    }
}
