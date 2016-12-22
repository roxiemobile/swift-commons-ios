// ----------------------------------------------------------------------------
//
//  UIDevice.swift
//
//  @author     Denis Kolyasev <KolyasevDA@ekassir.com>
//  @copyright  Copyright (c) 2015, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import UIKit

// ----------------------------------------------------------------------------

extension UIDevice
{
// MARK: - Methods

    public static func systemVersionEqualTo(version: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version, options: .NumericSearch) == .OrderedSame
    }

    public static func systemVersionGreaterThan(version: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version, options: .NumericSearch) == .OrderedDescending
    }

    public static func systemVersionGreaterThanOrEqualTo(version: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version, options: .NumericSearch) != .OrderedAscending
    }

    public static func systemVersionLessThan(version: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version, options: .NumericSearch) == .OrderedAscending
    }

    public static func systemVersionLessThanOrEqualTo(version: String) -> Bool {
        return UIDevice.currentDevice().systemVersion.compare(version, options: .NumericSearch) != .OrderedDescending
    }

// MARK: - Private Methods

    private func mdc_orientation() -> UIDeviceOrientation
    {
        let orientation = UIDevice.currentDevice().orientation
        switch (orientation)
        {
            case .Unknown:
                return .Portrait

            default:
                return orientation
        }
    }

    private func mdc_machine() -> String
    {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        //let mirror = reflect(machine)
        let mirror = Mirror(reflecting: machine)
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        // Done
        return identifier
    }

// MARK: - Inner Types

    public struct Model
    {
        public static let isIdiomPhone = {
            return (UIDevice.currentDevice().userInterfaceIdiom == .Phone)
        }()

        public static let isIdiomPhoneWidescreen = {
            return UIDevice.Model.isIdiomPhone && (UIScreen.mainScreen().bounds.size.height >= 568.0)
        }()

        public static let isIdiomPad = {
            return (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        }()

        public static let isRetinaDisplay = {
            return UIScreen.mainScreen().respondsToSelector(#selector(UIScreen.displayLinkWithTarget(_:selector:))) && (UIScreen.mainScreen().scale >= 2.0)
        }()

        public static let machine = {
            return UIDevice.currentDevice().mdc_machine()
        }()
    }

    public struct State
    {
        public static var isLandscape: Bool {
            return UIDevice.currentDevice().mdc_orientation().isLandscape
        }

        public static var isPortrait: Bool {
            return UIDevice.currentDevice().mdc_orientation().isPortrait
        }

        public static var isFlat: Bool {
            return UIDevice.currentDevice().mdc_orientation().isFlat
        }

        public static var isValidInterfaceOrientation: Bool {
            return UIDevice.currentDevice().mdc_orientation().isValidInterfaceOrientation
        }
    }

    public struct SystemVersion
    {
        public static let Major = {
            return (Inner.SystemVersion.count >= 1) ? Inner.SystemVersion[0] : 0
        }()

        public static let Minor = {
            return (Inner.SystemVersion.count >= 2) ? Inner.SystemVersion[1] : 0
        }()

        public static let Patch = {
            return (Inner.SystemVersion.count >= 3) ? Inner.SystemVersion[2] : 0
        }()
    }

// MARK: - Constants

    private struct Inner {
        static var SystemVersion = UIDevice.currentDevice().systemVersion.characters.split { $0 == "." }.map { String($0) }.map { Int($0) ?? 0 }
    }

}

// ----------------------------------------------------------------------------
