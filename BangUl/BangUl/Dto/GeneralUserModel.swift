//
//  GeneralUserModel.swift
//  BangUl
//
//  Created by Hyeji on 2021/09/12.
//

import Foundation

class GeneralUserModel: NSObject {
    var gId: String?
    var gPw: String?
    var gNickName: String?
    var gEmail: String?
    
    override init() {
    }
    
    init(gNickName: String) {
        self.gNickName = gNickName
    }
    
}
