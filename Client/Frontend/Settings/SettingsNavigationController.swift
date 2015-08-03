/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit

class SettingsNavigationController: UINavigationController {
    var profile: Profile!
    var tabManager: TabManager!
    var popoverDelegate: PresentingModalViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let rootViewController = SettingsTableViewController()
        rootViewController.profile = profile
        rootViewController.tabManager = tabManager
        self.pushViewController(rootViewController, animated: false)
    }

    func SELdone() {
        if let delegate = popoverDelegate {
            delegate.dismissPresentedModalViewController(self, animated: true)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

protocol PresentingModalViewControllerDelegate {
    func dismissPresentedModalViewController(modalViewController: UIViewController, animated: Bool)
}
