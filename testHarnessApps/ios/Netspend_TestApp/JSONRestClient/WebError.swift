//
//  WebError.swift
//  Netspend
//
//  Created by Hitesh Batra on 03/08/20.
//
//  Credits: Alexander Gaidukov Rest Client

import Foundation

public enum WebError<CustomError>: Error {
    case noInternetConnection
    case custom(CustomError)
    case unauthorized
    case other
}
