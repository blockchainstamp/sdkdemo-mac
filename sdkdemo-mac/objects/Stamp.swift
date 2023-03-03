//
//  Stamp.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/3.
//

import Foundation
import CoreData

extension CDStamp{
        static func hasObj(addr: String)->Bool{
                return false
        }
        
        func syncToDatabase() -> Error?{
                return nil
        }
}
