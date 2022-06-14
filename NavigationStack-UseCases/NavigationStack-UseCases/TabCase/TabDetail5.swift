//
//  TabDetail5.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import SwiftUI

struct TabDetail5: View {
   @EnvironmentObject var navigationManager : NavigationManager

    var body: some View {
        Text("Pop to root view")
          .onTapGesture {
             navigationManager.routes.removeAll()
          }

    }
}

struct TabDetail5_Previews: PreviewProvider {
    static var previews: some View {
        TabDetail5()
    }
}
