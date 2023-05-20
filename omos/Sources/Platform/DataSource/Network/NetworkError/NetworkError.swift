//
//  NetworkError.swift
//  omos
//
//  Created by sangheon on 2023/05/17.
//

import Foundation

import Alamofire

final class NetworkError {
    
    let error: Error
    
    var afError: AFError? {
        self.error as? AFError
    }
    
    var afUnderlyingError: Error? {
        self.afError?.underlyingError
    }
    
    var isAfUnderlyingError: Bool {
        self.afUnderlyingError != nil
    }
    
    var urlError: URLError? {
        self.afUnderlyingError as? URLError
    }
    
    init(error: Error) {
        self.error = error
    }
    
    func afErrorDebugDescription() -> [String] {
        guard let afError = self.afError else { return [] }
        
        var message = [String]()
        
        if let responseCode = afError.responseCode {
            message.append("Reponse Code: \(responseCode)")
        }
        if let responseContentType = afError.responseContentType {
            message.append("Response Content Type: \(responseContentType)")
        }
        if let failureReason = afError.failureReason {
            message.append("Failure Reason: \(failureReason)")
        }
        if let recoverySuggestion = afError.recoverySuggestion {
            message.append("Recovery Suggestion: \(recoverySuggestion)")
        }
        if let contentType = afError.responseContentType {
            message.append("Content Type: \(contentType)")
        }
        if let errorDescription = afError.errorDescription {
            message.append("Description: \(errorDescription)")
        }
        
        return message
    }
    
    func urlErrorDebugDescription() -> [String] {
        guard let urlError = self.urlError else { return [] }
        
        var message = [String]()
        
        if let urlString = urlError.failureURLString {
            message.append("Failure URLString: \(urlString)")
        }
        
        return message
    }
    
}
