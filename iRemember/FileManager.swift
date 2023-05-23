//
//  FileManager.swift
//  iRemember
//
//  Created by Matheus Viana on 23/05/23.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
