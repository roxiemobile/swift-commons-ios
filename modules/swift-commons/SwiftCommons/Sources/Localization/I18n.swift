// ----------------------------------------------------------------------------
//
//  I18n.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public struct I18n
{
// MARK: - Construction

    private init() {
        // Do nothing ..
    }

// MARK: - Functions

    public static func translate(defaultValue: String, strings: [Localization: String]? = nil) -> String
    {
        var localizedString = defaultValue

        // Look up for localized string
        if let strings = strings {
            for localization in Localization.preferredLocalizations {
                if let value = strings[localization] {
                    localizedString = value
                    break
                }
            }
        }

        // Done
        return localizedString
    }

// MARK: - Private Functions

    private static func description(strings: [Localization: String]) -> String
    {
        var output: String = ""

        for (key, value) in strings {
            output += (output.isEmpty ? "" : ", ") + key.description + ": " + value
        }

        return "[" + output + "]"
    }

// MARK: - Inner Types

    public enum Localization: String
    {
        // Languages
        case BE = "be" // Belarusian
        case DE = "de" // German
        case EN = "en" // English
        case FR = "fr" // French
        case RU = "ru" // Russian

        // Regions
        case BE_BY = "be-BY" // Belarusian (Belarus)
        case EN_GB = "en-GB" // British English
        case PT_PT = "pt-PT" // Portuguese (Portugal)

        public static var preferredLocalizations: [Localization]
        {
            struct Singleton
            {
                // iPhone & iPad (iOS) Localizations and Regions
                // @link http://hamishrickerby.com/2010/07/23/iphone-ipad-localizations-regions/

                // NSLocale preferredLanguages objectAtIndex:0 always return "en"
                // @link http://stackoverflow.com/a/26641497

                // Getting References to Bundle Resources
                // @link https://developer.apple.com/library/ios/documentation/CoreFoundation/Conceptual/CFBundles/AccessingaBundlesContents/AccessingaBundlesContents.html#//apple_ref/doc/uid/10000123i-CH104-SW7

                static let localizations: [Localization] = {

                    let bundle = NSBundle.mainBundle()
                    var output = [Localization]()

                    // look up for supported locales
                    for value in bundle.preferredLocalizations {
                        if let localization = Localization(rawValue: value ) {
                            output.append(localization)
                        }
                    }

                    // Done
                    return output.unique()
                }()
            }
            return Singleton.localizations
        }

        public var description: String {
            return self.rawValue
        }
    }

}

// ----------------------------------------------------------------------------
