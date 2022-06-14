//
//  TabDetail4.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct TabDetail4: View {
   @EnvironmentObject var navigationManager : NavigationManager

    var body: some View {
       VStack {
          Text("4")
          Button("Go to 6") {
             navigationManager.pushView(.tabDetail6)
          }
       }

    }
}

struct TabDetail4_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail4()
    }
}
