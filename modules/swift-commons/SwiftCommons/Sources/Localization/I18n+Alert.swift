// ----------------------------------------------------------------------------
//
//  I18n+Alert.swift
//
//  @author     Alexander Bragin <alexander.bragin@gmail.com>
//  @copyright  Copyright (c) 2015, MediariuM Ltd. All rights reserved.
//  @link       http://www.mediarium.com/
//
// ----------------------------------------------------------------------------

public extension I18n
{
// MARK: - Constants

    public struct Alert
    {
        public struct Title
        {
            public static let Error = "Ошибка"
            public static let Information = "Информация"
            public static let WorkInProgress = "В разработке"
            
            public static let Http401_Unauthorized = "Недоступно"
            public static let Http403_Forbidden = Http401_Unauthorized
            public static let Http404_NotFound = Error
            public static let Http406_NotAcceptable = Error
            public static let Http422_UnprocessableEntity = Error
            public static let Http500_InternalServerError = Error
            public static let Http502_BadGateway = Error
            public static let Http503_ServiceUnavailable = "Система обслуживается"
        }
    }
}

// ----------------------------------------------------------------------------
