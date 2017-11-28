# coding: utf-8
Pod::Spec.new do |s|

# MARK: - Description

  s.name                  = 'SwiftCommons'
  s.summary               = 'A collection of useful utility classes common to different iOS projects.'
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

  s.default_subspecs = 'Core/Abstractions',
                       'Core/Concurrent',
                       'Core/Data',
                       'Core/Diagnostics',
                       'Core/Extensions',
                       'Core/Lang',
                       'Core/Logging',
                       'Core/ObjC'

# MARK: - Modules

  # TODO: Write a description
  s.subspec 'Core' do |sc|

    # The core abstractions and public protocols used for iOS application development.
    sc.subspec 'Abstractions' do |sp|
      sp.dependency 'SwiftCommonsCoreAbstractions', s.version.to_s
    end

    # TODO: Write a description
    sc.subspec 'Concurrent' do |sp|
      sp.dependency 'SwiftCommonsCoreConcurrent', s.version.to_s
    end

    # A collection of reusable components used to simplify serialization, deserialization and validation operations on data objects.
    sc.subspec 'Data' do |sp|
      sp.dependency 'SwiftCommonsCoreData', s.version.to_s
    end

    # A collection of static classes for debugging and diagnostics of program contracts such as preconditions, postconditions, and invariants.
    sc.subspec 'Diagnostics' do |sp|
      sp.dependency 'SwiftCommonsCoreDiagnostics', s.version.to_s
    end

    # A collection of useful type extensions used for iOS application development.
    sc.subspec 'Extensions' do |sp|
      sp.dependency 'SwiftCommonsCoreExtensions', s.version.to_s
    end

    # A collection of useful classes and Swift language extensions.
    sc.subspec 'Lang' do |sp|
      sp.dependency 'SwiftCommonsCoreLang', s.version.to_s
    end

    # Provides simple abstraction layer over an existing logging frameworks.
    sc.subspec 'Logging' do |sp|
      sp.dependency 'SwiftCommonsCoreLogging', s.version.to_s
    end

    # Provides simple abstraction layer over an existing logging frameworks.
    sc.subspec 'ObjC' do |sp|
      sp.dependency 'SwiftCommonsCoreObjC', s.version.to_s
    end
  end

  # TODO: Write a description
  s.subspec 'Infrastructure' do |sc|

    # TODO: Write a description
    sc.subspec 'Database' do |sp|
      sp.dependency 'SwiftCommonsInfrastructureDatabase', s.version.to_s
    end
  end
end
