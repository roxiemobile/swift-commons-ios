# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommonsObjC'
  s.summary               = 'A collection of Objective-C frameworks, utility classes and 3rd party libraries used by other modules of this library.'
  s.version               = '1.6.2'

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

  base_dir = 'Modules/RoxieMobile.SwiftCommons/Sources/ObjC/'
  s.source_files = base_dir + '{Sources,Dependencies}/**/*.{h,m,c}'

  s.public_header_files = [
    # GHODictionary
    base_dir + 'Sources/GHODictionary/GHODict.h',
    # MPMessagePack
    base_dir + 'Sources/MPMessagePack/MPMessagePackReader.h',
    base_dir + 'Sources/MPMessagePack/MPMessagePackWriter.h',
    base_dir + 'Sources/MPMessagePack/NSArray+MPMessagePack.h',
    base_dir + 'Sources/MPMessagePack/NSData+MPMessagePack.h',
    base_dir + 'Sources/MPMessagePack/NSDictionary+MPMessagePack.h',
    # TryCatchFinally
    base_dir + 'Sources/TryCatchFinally/TryCatchFinally.h'
  ]

  s.pod_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => "$(inherited) SWIFTCOMMONS_FRAMEWORK_VERSION=@\\\"#{s.version}\\\""
  }
end
