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

  s.default_subspecs      = 'Core/Concurrent',
                            'Core/Extensions',
                            'Core/Lang',
                            'Core/Logging',
                            'Infrastructure/Database'

# MARK: - Modules

  # TODO: Write a description
  s.subspec 'Core' do |sc|

    # TODO: Write a description
    sc.subspec 'Concurrent' do |sp|
      sp.source_files = 'modules/RoxieMobile.SwiftCommons/Core.Concurrent/Module/**/*.{swift,h,m,c}'
    end

    # A collection of useful type extensions used for iOS application development.
    sc.subspec 'Extensions' do |sp|
      sp.source_files = 'modules/RoxieMobile.SwiftCommons/Core.Extensions/Module/**/*.{swift,h,m,c}'

      # Dependencies
      sp.dependency 'SwiftCommons/Core/Lang', s.version.to_s
      sp.dependency 'SwiftCommons/Core/Logging', s.version.to_s
    end

    # A collection of useful classes and Swift language extensions.
    sc.subspec 'Lang' do |sp|
      sp.source_files = 'modules/RoxieMobile.SwiftCommons/Core.Lang/Module/**/*.{swift,h,m,c}'
    end

    # Provides simple abstraction layer over an existing logging frameworks.
    sc.subspec 'Logging' do |sp|
      sp.source_files = 'modules/RoxieMobile.SwiftCommons/Core.Logging/Module/**/*.{swift,h,m,c}'

      # Dependencies
      sp.dependency 'SwiftCommons/Core/Concurrent', s.version.to_s
      sp.dependency 'SwiftCommons/Core/Lang', s.version.to_s
    end
  end

  # TODO: Write a description
  s.subspec 'Infrastructure' do |sc|

    # TODO: Write a description
    sc.subspec 'Database' do |sp|
      sp.source_files = 'modules/RoxieMobile.SwiftCommons/Infrastructure.Database/Module/**/*.{swift,h,m,c}'

      # Dependencies
      sp.dependency 'SwiftCommons/Core/Concurrent', s.version.to_s
      sp.dependency 'SwiftCommons/Core/Extensions', s.version.to_s
      sp.dependency 'SwiftCommons/Core/Lang', s.version.to_s
      sp.dependency 'SwiftCommons/Core/Logging', s.version.to_s
      sp.dependency 'CryptoSwift', '~> 0.7'
      sp.dependency 'SQLCipher', '~> 3.4'
    end
  end
end
