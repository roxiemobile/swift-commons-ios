# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsInfrastructureDatabase'
  s.summary               = 'TODO:'
  s.version               = '0.0.1'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.cocoapods_version     = '>= 1.4.0.beta.2'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: s.version.to_s
  }

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Infrastructure.Database/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SQLITE_HAS_CODEC=1 SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_SQLCIPHER',
    'SWIFT_VERSION' => '4.0'
  }
  s.user_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SQLITE_HAS_CODEC=1',
    'OTHER_SWIFT_FLAGS' => '$(inherited) -DSQLITE_SWIFT_SQLCIPHER'
  }

# MARK: - Dependencies

  s.dependency 'CryptoSwift/Static', '~> 0.8.0'
  s.dependency 'SwiftCommonsCoreConcurrent', s.version.to_s
  s.dependency 'SwiftCommonsCoreExtensions', s.version.to_s
  s.dependency 'SQLite.swift/SQLCipher/Static', '~> 0.11.4'
end
