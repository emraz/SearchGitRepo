//
//  Bundle+Json.swift
//  SearchGitRepo
//
//  Created by Mahmudul Hasan Razib on 10/7/22.
//

import Foundation

extension Bundle {

    func jsonData(fileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch (let error){
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
}
