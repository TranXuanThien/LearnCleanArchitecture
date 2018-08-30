//
//  String+Base64.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/7/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import Foundation

extension String {
    /// Encode a String to Base64
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    /// Decode a String from Base64. Returns nil if unsuccessful.
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
