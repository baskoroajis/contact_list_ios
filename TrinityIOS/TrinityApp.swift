//
//  TrinityApp.swift
//  Trinity
//
//  Created by Baskoro on 13/03/23.
//

import SwiftUI

@main
struct TrinityApp: App {
    var body: some Scene {
        WindowGroup {
            ContactListView()
        }
    }
}

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
