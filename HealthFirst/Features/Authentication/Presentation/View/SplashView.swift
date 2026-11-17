//
//  SplashView.swift
//  HealthFirst
//
//  Created by Himanshu on 11/10/26.
//

import SwiftUI

struct SplashView: View {
    
    @State public var splashViewModel: SplashViewModel = SplashViewModel(determineInitialScreenUseCase: DetermineInitialScreenUseCase())
    @State public var isNavigateToLoginView: Bool = false
    
    var body: some View {
        VStack {
            Image("app_icon")
                .resizable()
                .frame(width: 130, height: 130)
            
            Group {
                Text("Health")
                Text("First")
            }
            .font(.custom("LeagueSpartan-Light", size: 48))
            .foregroundStyle(Color("_FFFFFF"))
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("_2260FF"))
        .task {
            await splashViewModel.start()
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                isNavigateToLoginView.toggle()
            })
        }
        .navigationDestination(isPresented: $isNavigateToLoginView) {
            LoginView()
        }
    }
}

#Preview {
    SplashView()
}
