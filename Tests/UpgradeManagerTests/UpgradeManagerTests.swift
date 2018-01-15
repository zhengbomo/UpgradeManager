//
//  UpgradeManagerTests.swift
//  bomo
//
//  Created by bomo on 1/15/18.
//  Copyright © 2018 bomo. All rights reserved.
//

import Foundation
import XCTest
import UpgradeManager

class UpgradeManagerTests: XCTestCase {
    func testExample() {




        let versions: [VersionProtocol] = [
            InitVersion(),
            AddNameColumnVersion()
        ]
        UpgradeManager.shared.setVersion(versions: versions)

        assert(!UserDefaults.standard.bool(forKey: "InitVersion"))
        assert(!UserDefaults.standard.bool(forKey: "AddNameColumnVersion"))

        UpgradeManager.shared.upgrade()

        assert(UserDefaults.standard.bool(forKey: "InitVersion"))
        assert(UserDefaults.standard.bool(forKey: "AddNameColumnVersion"))
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
