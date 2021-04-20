#!/bin/sh

pod trunk push --synchronous SwiftCommonsAbstractions.podspec
pod trunk push --synchronous SwiftCommonsObjC.podspec
pod trunk push --synchronous SwiftCommonsConcurrent.podspec
pod trunk push --synchronous SwiftCommonsLang.podspec
pod trunk push --synchronous SwiftCommonsLogging.podspec
pod trunk push --synchronous SwiftCommonsExtensions.podspec
pod trunk push --synchronous SwiftCommonsDiagnostics.podspec
pod trunk push --synchronous --allow-warnings SwiftCommonsData.podspec
pod trunk push --synchronous SwiftCommons.podspec
