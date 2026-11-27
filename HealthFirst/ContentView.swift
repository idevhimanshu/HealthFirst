//
//  ContentView.swift
//  HealthFirst
//
//  Created by LAPTOP BAZAAR on 28/09/26.
//

//
//  ContentView.swift
//  HealthFirst
//
//  Created by LAPTOP BAZAAR on 28/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationViewModel = NavigationViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationViewModel.path) {
            MainView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .customTabBar:
                        CustomTabBarView()
                    case .loginScreen:
                        LoginView()
                    case .editProfileView:
                        EditProfileView()
                    }
                }
        }
        .environment(navigationViewModel)
        .tint(Color("_2260FF"))
    }
}

struct MainView: View {
    @Environment(NavigationViewModel.self) private var navigationViewModel
    
    var body: some View {
        // Render views directly inside body, not inside .onAppear
        Group {
            switch navigationViewModel.root {
            case .splash:
                SplashView()
            case .login:
                LoginView()
            case .tabBar:
                CustomTabBarView()
            }
        }
    }
}

// MARK: - Navigation Models & ViewModel

enum Route: Hashable {
    case customTabBar
    case loginScreen
    case editProfileView
}

enum RootView {
    case login
    case tabBar
    case splash
    
}

@Observable
final class NavigationViewModel {
    var root: RootView = .splash
    var path = NavigationPath()
    
    func goNextScreen(screen: Route) {
        path.append(screen)
    }
    
    func goBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
    
    func setRoot(screen: RootView) {
        popToRoot()
        root = screen
    }
}

#Preview {
    ContentView()
}
