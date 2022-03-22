# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsConcurrent'
  s.summary               = 'A collection of reusable components used to simplify the work of writing concurrent and asynchronous code.'
  s.version               = '1.6.3'

  s.platform              = :ios
  s.ios.deployment_target = '12.0'
  s.swift_version         = '5.5'

  s.cocoapods_version     = '~> 1.11.3'
  s.static_framework      = true

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'
  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = 'BSD-4-Clause'

# MARK: - Configuration

  s.source = {
    git: 'https://github.com/roxiemobile/swift-commons.ios.git',
    tag: "v#{s.version.to_s}"
  }

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Concurrent/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.swift'

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }

# MARK: - Dependencies

  s.dependency 'SwiftCommonsObjC', s.version.to_s
end
