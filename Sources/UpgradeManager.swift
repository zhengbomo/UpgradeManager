//
//  UpgradeManager.swift
//  bomo
//
//  Created by bomo on 1/15/18.
//  Copyright © 2018 bomo. All rights reserved.
//

import Foundation

public protocol VersionProtocol {
    /// version number, new version must be lager then old version
    var version: Int { get }

    /// upgrade logic
    func upgrade()
}

public final class UpgradeManager {
    public static let shared = UpgradeManager()

    private var versions: [VersionProtocol]?

    // private constructor
    private init() {

    }

    /// inject versions
    public func setVersion(versions: [VersionProtocol]) {
        self.versions = versions.sorted { $0.version < $1.version }
    }

    /// inject sorted versions（version from low to high）
    public func setOrderedVersion(versions: [VersionProtocol]) {
        self.versions = versions
    }

    /// 升级版本
    public func upgrade() {
        assert(self.versions != nil, "version can not be null, must call setVersion: first")

        let currentVersion = self.currentVersion
        guard let lastVersion = self.versions?.last, currentVersion < lastVersion.version else {
            // no versions or current is on lastest version
            return
        }

        self.versions?.forEach({ (version) in
            if version.version > currentVersion {
                version.upgrade()
                self.currentVersion = version.version
            }
        })
    }
}

extension UpgradeManager {
    /// save current version in UserDefaults
    private static let kCurrentVersionkey = "com.version.app.currentVersionKey"

    fileprivate var currentVersion: Int {
        get {
            return UserDefaults.standard.integer(forKey: UpgradeManager.kCurrentVersionkey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UpgradeManager.kCurrentVersionkey)
        }
    }
}
