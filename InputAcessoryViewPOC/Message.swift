//
//  Message.swift
//  InputAccessoryViewPOC
//
//  Created by Itallo Rossi Lucas on 11/08/17.
//  Copyright © 2017 kallahir. All rights reserved.
//

import Foundation

class Message {
    
    var text: String!
    var userId: Int!
    var userName: String!
    
    init(text: String, userId: Int, userName: String) {
        self.text = text
        self.userId = userId
        self.userName = userName
    }
    
}
