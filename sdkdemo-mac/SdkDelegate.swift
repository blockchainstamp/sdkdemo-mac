//
//  SdkDelegate.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/3.
//

import Foundation
class SdkDelegate{
        public static func isValidEtherAddr(sAddr:String)->Bool{
                return false
        }
        public static func  stampConfFromBlockChain(sAddr: String)-> CDStamp?{
                return nil
        }
        
        public static func getCurrentWalletAddress(emailAcc:String)->(String, String){
                return ("","")
        }
        public static func stampBalanceOfWallet(ethAddr:String, stampAddr:String) async ->(Int64, Int64){
                return (0,0)
        }
}
