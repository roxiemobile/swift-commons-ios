# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsCoreObjC'
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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/Core.ObjC/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.{h,m,c}'

  s.public_header_files = [
    base_dir + 'Sources/SSZipArchive/SSZipArchive.h',
    base_dir + 'Sources/SSZipArchive/SSZipArchiveDelegate.h',
    base_dir + 'Sources/SSZipArchive/minizip/unzip.h',
    base_dir + 'Sources/SSZipArchive/minizip/ioapi.h',
    base_dir + 'Sources/StreamTypedCoder/StreamTypedCoder.h',
    base_dir + 'Sources/TryCatchFinally/TryCatchFinally.h'
  ]

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\"",
    'SWIFT_VERSION' => '4.0'
  }
end
