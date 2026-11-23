//
//  ContentView.swift
//  HealthFirst
//
//  Created by LAPTOP BAZAAR on 28/09/26.
//

import SwiftUI

struct ContentView: View {
    @State var navigationViewModel: NavigationViewModel = NavigationViewModel()
    var body: some View {
        NavigationStack(path: $navigationViewModel.path) {
                SplashView()
                
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .customTabBar:
                        CustomTabBarView()
                    case .loginScreen:
                        LoginView()
                    }
                }
        }
        .environment(navigationViewModel)
        .tint(Color("_2260FF"))
    }
}

#Preview {
    ContentView()
}

enum Route: Hashable {
    case customTabBar
    case loginScreen
}

@Observable
final class NavigationViewModel {
    
    var path = NavigationPath()
    
    func goNextScreen(screen: Route){
        path.append(screen)
    }
    
    func removeAll() {
            path = NavigationPath()
        }
}
