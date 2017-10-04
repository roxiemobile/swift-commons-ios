# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommons.Infrastructure.Database'
  s.summary               = 'TODO:'
  s.version               = '0.0.1'

  s.platform              = :ios
  s.ios.deployment_target = '8.0'

  s.authors               = { 'Roxie Mobile Ltd.' => 'sales@roxiemobile.com', 'Alexander Bragin' => 'bragin-av@roxiemobile.com' }
  s.license               = { type: 'BSD-4-Clause', file: 'LICENSE.txt' }

  s.homepage              = 'https://github.com/roxiemobile/swift-commons.ios'

  s.source                = { git: 'https://github.com/roxiemobile/swift-commons.ios.git', tag: "v#{s.version}" }
  s.preserve_path         = 'LICENSE.txt'

  s.pod_target_xcconfig   = { 'ENABLE_BITCODE' => 'NO', 'SWIFT_VERSION' => '4.0' }

# s.default_subspecs      = 'Lang', 'Deprecated'


# MARK: - Modules

  s.subspec 'SwiftCommons' do |s1|
    s1.subspec 'Infrastructure' do |s2|
      s2.subspec 'Database' do |s3|
        s3.source_files = 'modules/RoxieMobile.SwiftCommons/Infrastructure.Database/Module/**/*.{swift,h,m,c}'
      end
    end
  end
end
