//
//  InitVersion.swift
//  BMWeChat
//
//  Created by bomo on 1/15/18.
//  Copyright © 2018 bomo. All rights reserved.
//

import Foundation
import UpgradeManager

class InitVersion: VersionProtocol {
    var version: Int {
        return 1
    }

    func upgrade() {
        UserDefaults.standard.set(true, forKey: "InitVersion")
    }
}

class AddNameColumnVersion: VersionProtocol {
    var version: Int {
        return 2
    }

    func upgrade() {
        UserDefaults.standard.set(true, forKey: "AddNameColumnVersion")
    }
}
