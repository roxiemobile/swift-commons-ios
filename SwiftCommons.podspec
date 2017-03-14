# coding: utf-8
Pod::Spec.new do |s|

  s.name                  = 'SwiftCommons'
  s.summary               = 'A collection of useful utility classes common to different iOS projects.'
  s.version               = '0.7.2'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = { 'Alexander Bragin' => 'bragin-av@roxiemobile.com', 'Denis Kolyasev' => 'kolyasevda@ekassir.com' }

  s.license               = { type: 'BSD-4-Clause', file: 'LICENSE.txt' }

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'

  s.source                = { git: 'https://github.com/roxiemobile/swift-commons.ios.git', tag: s.version.to_s }
  s.source_files          = 'modules/swift-commons/SwiftCommons/**/*.{h,m,c,swift}'
  s.vendored_libraries    = 'modules/swift-commons/SwiftCommons/Libraries/**/*.a'
  s.preserve_path         = 'LICENSE.txt'

  s.xcconfig              = { 'GCC_PREPROCESSOR_DEFINITIONS' => 'SQLITE_HAS_CODEC=1' }
  s.pod_target_xcconfig   = { 'ENABLE_BITCODE' => 'NO' }

  # External dependencies
  s.dependency 'SwiftyJSON', '~> 2.4'

end
