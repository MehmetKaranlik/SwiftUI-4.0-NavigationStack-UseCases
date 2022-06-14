//
//  TabDetail7.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct TabDetail7: View {
   @EnvironmentObject var navManager : NavigationManager
    var body: some View {
       VStack {
          Text("7")
          Button("Pop until 4") {
             navManager.popUntil(.tabDetail4)
          }
       }

    }
}

struct TabDetail7_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail7()
    }
}
