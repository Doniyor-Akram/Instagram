//
//  StarterView.swift
//  iosMyinsta
//
//  Created by Doniyor on 06/08/22.
//

import SwiftUI

struct StarterView: View {
    // MARK: Operators
    @EnvironmentObject var session: SessionServer
    
    // MARK: - Body
    var body: some View {
        VStack {
            if self.session.user != nil {
                HomeView()
            } else {
                SignInView()
            }
        }
        .onAppear {
            session.listen()
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
