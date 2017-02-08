// ----------------------------------------------------------------------------
//
//  ChainedLogger.swift
//
//  @author     Nikita Semakov <SemakovNV@ekassir.com>
//  @copyright  Copyright (c) 2017, eKassir Ltd. All rights reserved.
//  @link       http://www.ekassir.com/
//
// ----------------------------------------------------------------------------

import Foundation

// ----------------------------------------------------------------------------

public class ChainedLogger: ContractProtocol
{
// MARK: - Construction

    init(loggers: ContractProtocol...) {
        // Init instance variables
        self.mLoggers = loggers.isEmpty ? [] : loggers
    }

// MARK: - Functions

    public func v(tag: String, msg: String){
        for logger in self.mLoggers {
            logger.v(tag, msg: msg)
        }
    }

    public func d(tag: String, msg: String) {
        for logger in self.mLoggers {
            logger.d(tag, msg: msg)
        }
    }

    public func i(tag: String, msg: String) {
        for logger in self.mLoggers {
            logger.i(tag, msg: msg)
        }
    }

    public func w(tag: String, err: NSError?) {
        for logger in self.mLoggers {
            logger.w(tag, err: err)
        }
    }

    public func w(tag: String, exc: NSException?) {
        for logger in self.mLoggers {
            logger.w(tag, exc: exc)
        }
    }

    public func w(tag: String, err: ErrorType?) {
        for logger in self.mLoggers {
            logger.w(tag, err: err)
        }
    }

    public func w(tag: String, msg: String, err: NSError?) {
        for logger in self.mLoggers {
            logger.w(tag, msg: msg, err: err)
        }
    }

    public func w(tag: String, msg: String, exc: NSException?) {
        for logger in self.mLoggers {
            logger.w(tag, msg: msg, exc: exc)
        }
    }

    public func w(tag: String, msg: String, err: ErrorType?) {
        for logger in self.mLoggers {
            logger.w(tag, msg: msg, err: err)
        }
    }

    public func e(tag: String, err: NSError?) {
        for logger in self.mLoggers {
            logger.e(tag, err: err)
        }
    }

    public func e(tag: String, exc: NSException?) {
        for logger in self.mLoggers {
            logger.e(tag, exc: exc)
        }
    }

    public func e(tag: String, err: ErrorType?) {
        for logger in self.mLoggers {
            logger.e(tag, err: err)
        }
    }

    public func e(tag: String, msg: String, err: NSError?) {
        for logger in self.mLoggers {
            logger.e(tag, msg: msg, err: err)
        }
    }

    public func e(tag: String, msg: String, exc: NSException?) {
        for logger in self.mLoggers {
            logger.e(tag, msg: msg, exc: exc)
        }
    }

    public func e(tag: String, msg: String, err: ErrorType?) {
        for logger in self.mLoggers {
            logger.e(tag, msg: msg, err: err)
        }
    }

// MARK: - Variables

    private var mLoggers: [ContractProtocol]

}

// ----------------------------------------------------------------------------
