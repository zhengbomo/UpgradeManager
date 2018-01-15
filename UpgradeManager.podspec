Pod::Spec.new do |s|
  s.name         = "UpgradeManager"
  s.version      = "0.1"
  s.summary      = ""
  s.description  = <<-DESC
    data progress when upgrade app, like add column in database, data migration, data initialize
  DESC
  s.homepage     = "https://github.com/zhengbomo/UpgradeManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "bomo" => "zhengbomo@hotmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/zhengbomo/UpgradeManager.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
