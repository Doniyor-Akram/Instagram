//
//  SessionServer.swift
//  iosMyinsta
//
//  Created by Doniyor on 13/08/22.
//

import Foundation
import Combine

class SessionServer: ObservableObject {
    
    var didChange = PassthroughSubject<SessionServer, Never>()
    @Published var user: Users? { didSet { self.didChange.send(self) } }
    
    func listen() {
        self.user = Users(uid: "Some id", displayName: "Some name", email: "Some email")
        //self.user = nil
    }
}
