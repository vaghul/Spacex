//
//  String+.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-06.
//

import Foundation

extension String {
    func localize() -> String {
        let value = NSLocalizedString(self, comment: "")
        return value == self ? "" : value
    }
}
