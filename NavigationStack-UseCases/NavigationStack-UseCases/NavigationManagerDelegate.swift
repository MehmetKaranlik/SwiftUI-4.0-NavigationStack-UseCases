//
//  NavigationViewDelegate.swift
//  NavigationStack-UseCases
//
//  Created by mehmet karanlık on 14.06.2022.
//

import Foundation

protocol NavigationManagerDelegate {
   associatedtype Route = NavigationPaths
   func pushView(_ newView : Route)
   func popToRoot()
   func pop()
   func popUntil (_ targetRoute : Route)

}
