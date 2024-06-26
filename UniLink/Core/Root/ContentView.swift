//
//  ContentView.swift
//  UniHelp
//
//  Created by Evan Best on 2024-03-09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        Group {
            if viewModel.userSession != nil && viewModel.currentUser != nil {
                ZStack {
                    switch selectedTab {
                    case .chat:
                        Text("Chat")
                    case .search:
                        SearchView()
                    case .home:
                        HomeView()
                    case .add:
                        AddView()
                    case .user:
                        ProfileView()
                    }
                    TabView()
                }
                    
            } else {
                LoginView()
            }
        }
    }
}


#Preview {
    ContentView()
        .environmentObject(StudySessionViewModel())
        .environmentObject(AuthViewModel())
}
