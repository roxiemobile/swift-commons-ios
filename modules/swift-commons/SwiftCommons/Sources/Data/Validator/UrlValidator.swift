// ----------------------------------------------------------------------------
//
//  UrlValidator.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

// Regular Expression for URL validation
// @link https://gist.github.com/dperini/729294

// In search of the perfect URL validation regex
// @link https://mathiasbynens.be/demo/url-regex

// ----------------------------------------------------------------------------

public final class UrlValidator: NonCreatable, StaticValidator
{
// MARK: - Functions

    public class func isValid(value: AnyObject?) -> Bool
    {
        var result = false

        // Validate incoming value
        if let validator = Inner.Validator
        {
            if let value = value as? String {
                result = validator.isValid(value)
            }
            else
            if let value = value as? NSURL {
                result = validator.isValid(value.absoluteString)
            }
        }

        // Done
        return result
    }

// MARK: - Constants

    private struct Inner
    {
        struct Pattern
        {
            // @diegoperini's version
            static let WebUrl = ""
                + "^"
                    // Protocol identifier
                    + "(?:(?:https?|ftp)://)"
                    // User:Pass authentication
                    + "(?:\\S+(?::\\S*)?@)?"
                    + "(?:"
                        // IP address exclusion private & local networks
                        // + "(?!(?:10|127)(?:\\.\\d{1,3}){3})"
                        // + "(?!(?:169\\.254|192\\.168)(?:\\.\\d{1,3}){2})"
                        // + "(?!172\\.(?:1[6-9]|2\\d|3[0-1])(?:\\.\\d{1,3}){2})"

                        // IP address dotted notation octets
                        // excludes loopback network 0.0.0.0
                        // excludes reserved space >= 224.0.0.0
                        // excludes network & broacast addresses (first & last IP address of each class)
                        + "(?:[1-9]\\d?|1\\d\\d|2[01]\\d|22[0-3])"
                        + "(?:\\.(?:1?\\d{1,2}|2[0-4]\\d|25[0-5])){2}"
                        + "(?:\\.(?:[1-9]\\d?|1\\d\\d|2[0-4]\\d|25[0-4]))"
                    + "|"
                        // Host name
                        + "(?:(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)"
                        // Domain name
                        + "(?:\\.(?:[a-z\\u00a1-\\uffff0-9]-*)*[a-z\\u00a1-\\uffff0-9]+)*"
                        // TLD identifier
                        + "(?:\\.(?:[a-z\\u00a1-\\uffff]{2,}))"
                    + ")"
                    // Port number
                    + "(?::\\d{2,5})?"
                    // Resource path
                    + "(?:/\\S*)?"
                + "$"
          }

        static let Validator = RegexValidator(Pattern.WebUrl)
    }

}

// ----------------------------------------------------------------------------
