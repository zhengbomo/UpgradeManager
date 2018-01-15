# 版本升级框架

## Feature
1. 维护版本升级（如：数据库升级，数据迁移，数据初始化等）
2. 跨版本升级（增量升级）

## 依赖
1. 通过UserDefault保存当前版本，key=`com.version.app.currentVersionKey`


## 约定
1. `Version`必须实现`VersionProtocal`协议，通过`upgrade`实现升级逻辑
2. `Version`必须声明版本号
2. 新版本号必须大于旧版本号
3. 旧版本确定后不能改动
4. 每个版本的版本号必须不一样，如果升级逻辑比较多，可以拆分成多个版本来升级
5. VersionProtocol的版本号可以不与App的版本号一致


## 使用
1. 在应用启动（`application:willFinishLaunchingWithOptions:`）的时候执行
```swift
// 版本号按从小到大顺序
let versions: [VersionProtocol] = [
    InitVersion(),
    AddColumnVersion(),
    DataMigrationVersion()
]

// 设置版本号
UpgradeManager.shared.setVersion(versions: versions)

// 更新版本
UpgradeManager.shared.upgrade()
```
versions随着版本迭代逐渐增多

2. Version的定义
```objc
import UpgradeManager

class AddNameColumnVersion: VersionProtocol {
    var version: Int {
        // 新版本号必须大于旧版本号
        return 2
    }

    func upgrade() {
        DbService.addNameColumn()
    }
}
```
