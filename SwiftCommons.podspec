# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommons'
  s.summary               = 'A collection of useful utility classes common to different iOS projects.'
  s.version               = '0.0.1'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = { type: 'BSD-4-Clause', file: 'LICENSE.txt' }

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'

  s.source                = { git: 'https://github.com/roxiemobile/swift-commons.ios.git', tag: "v#{s.version}" }
  s.preserve_path         = 'LICENSE.txt'

  s.pod_target_xcconfig   = { 'ENABLE_BITCODE' => 'NO', 'SWIFT_VERSION' => '4.0' }

  s.default_subspecs      = 'Lang', 'Deprecated'


# MARK: - Modules

  s.subspec 'Lang' do |sp|
    # A collection of useful classes and Swift language extensions
    sp.source_files = 'modules/RoxieMobile.SwiftCommons/SwiftCommons.Lang/Lang/**/*.{swift,h,m,c}'
  end

  s.subspec 'Deprecated' do |sp|
    # TODO: Write a description
    sp.source_files = 'modules/RoxieMobile.SwiftCommons/SwiftCommons.Deprecated/Deprecated/**/*.{swift,h,m,c}'

    # External dependencies
    sp.dependency 'SwiftCommons/Lang', s.version.to_s
    sp.dependency 'SQLCipher', '~> 3.4'
  end
end
