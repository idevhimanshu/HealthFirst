//
//  HomeView.swift
//  HealthFirst
//
//  Created by chetu on 28/09/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    @State private var homeViewModel: HomeViewModel = HomeViewModel(homeUseCasesProtocol: HomeUseCases(homeRepository: HomeRepositoryImpl(networkManager: NetworkManger.shared)))
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        
                        Image("ProfilePhoto")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                        
                        VStack(alignment: .leading) {
                            Text("Hii, Welcome back")
                                .font(.custom("LeagueSpartan-Light", size: 18))
                                .foregroundColor(Color("_2260FF"))
                            Text("Jhon Doe")
                        }
                        
                        Spacer()
                        
                        Image("Notification")
                            .resizable()
                            .frame(width: 22, height: 22)
                        
                        Image("Setting")
                            .resizable()
                            .frame(width: 22, height: 22)
                        
                    }
                    .padding(.horizontal, 16)
                    
                    HStack(spacing: 10) {
                        VStack {
                            Image("Stethoscope")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("Doctors")
                                .foregroundColor(Color("_2260FF"))
                                .font(.custom("LeagueSpartan-Light", size: 18))
                        }
                        
                        VStack {
                            Image("Heart")
                                .resizable()
                                .frame(width: 22, height: 22)
                            
                            Text("Favorite")
                                .foregroundColor(Color("_2260FF"))
                                .font(.custom("LeagueSpartan-Light", size: 18))
                            
                            
                        }
                        
                        ZStack(alignment: .leading) {
                            HStack {
                                TextField("", text: $searchText)
                                    .font(.custom("LeagueSpartan-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 16)
                                    .frame(height: 45)
                                    .background(Color("_CAD6FF"))
                                    .cornerRadius(24)
                            }
                            .overlay {
                                HStack {
                                    Spacer()
                                    Image("SearchIcon")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .padding(.trailing)
                                }
                                
                            }
                            
                            Image("Sorting")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.leading, 5)
                            
                        }
                    }
                    .padding(.horizontal, 16)
                    
                        VStack {
                            HStack {
                            ForEach(0..<5) { _ in
                               
                                    VStack(spacing: 5) {
                                        Text("9")
                                            .font(.custom("LeagueSpartan-Medium", size: 24))
                                        
                                        Text("MON")
                                            .font(.custom("LeagueSpartan-Light", size: 16))
                                    }
                                    
                                    .padding(.top, 17)
                                    .padding(.bottom, 12)
                                    .padding(.horizontal, 13)
                                    .background(Color.white)
                                    .cornerRadius(22)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("11 Wednesday - Today")
                                    .font(.custom("LeagueSpartan-Light", size: 16))
                                    .foregroundColor(Color("_2260FF"))
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                HStack(spacing: 10) {
                                    VStack(spacing: 12) {
                                        ForEach(0..<4) { _ in
                                            Text("9 am")
                                                .font(.custom("LeagueSpartan-Light", size: 16))
                                                .foregroundColor(Color("_2260FF"))
                                        }
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        HStack {
                                            Text("Dr. Olivia Turner, M.D.")
                                                .font(.custom("LeagueSpartan-Medium", size: 14))
                                                .foregroundColor(Color("_2260FF"))
                                            Spacer()
                                            Circle()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.white)
                                                .overlay {
                                                    Image("CheckMark")
                                                        .resizable()
                                                        .frame(width: 10, height: 10)

                                                }
                                            
                                            Circle()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.white)
                                                .overlay {
                                                    Image("CrossMark")
                                                        .resizable()
                                                        .frame(width: 10, height: 10)

                                                }
                                            
                                        }
                                        
                                        Text("Treatment and prevention of skin and photodermatitis.")
                                            .lineLimit(0)
                                            .font(.custom("LeagueSpartan-Light", size: 12))
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 9)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .background(Color("_CAD6FF"))
                                    .cornerRadius(13)
                                }
                            }
                            .padding(16)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .background(.white)
                            .cornerRadius(20)
                                
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .background(Color("_CAD6FF"))
                    
                    VStack {
                        ForEach(homeViewModel.doctorList, id: \.id) { doctor in
                            
                            
                            HStack(alignment: .top) {
                                
                                Image("ProfilePhoto")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(40)
                                
                                VStack {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Dr. \(doctor.name)")
                                                .font(.custom("LeagueSpartan-Medium", size: 14))
                                                .foregroundColor(Color("_2260FF"))
                                            Text(doctor.specializaiton)
                                                .font(.custom("LeagueSpartan-Light", size: 12))
                                            
                                            
                                        }
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 9)
                                        
                                    }
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .background(Color.white)
                                    .cornerRadius(13)
                                    HStack {
                                        HStack {
                                            
                                            Image("star")
                                                .resizable()
                                                .frame(width: 16, height: 16)
                                            HStack {
                                                Text("\(doctor.rating)")
                                                    .font(.custom("LeagueSpartan-Light", size: 16))
                                            }
                                            .padding(.top, 3)
                                            
                                        }
                                        .padding(5)
                                        .padding(.trailing, 16)
                                        .background(Color.white)
                                        .cornerRadius(13)
                                        
                                        HStack {
                                            
                                            Image("reviewIcon")
                                                .resizable()
                                                .frame(width: 16, height: 16)
                                            HStack {
                                                Text("\(doctor.commentCount)")
                                                    .font(.custom("LeagueSpartan-Light", size: 16))
                                            }
                                            .padding(.top, 3)
                                            
                                        }
                                        .padding(5)
                                        .padding(.trailing, 16)
                                        .background(Color.white)
                                        .cornerRadius(13)
                                        
                                        Spacer()
                                        
                                        Circle()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.white)
                                            .overlay {
                                                Image("questionMarkIcon")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                                
                                            }
                                        
                                        Circle()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.white)
                                            .overlay {
                                                Image("Heart")
                                                    .resizable()
                                                    .frame(width: 10, height: 10)
                                            }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .background(Color("_CAD6FF"))
                            .cornerRadius(17)
                        }
                        
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
//        .onAppear(perform: {
//            KeychainManager.shared.deleteAll()
//        })
        .task{
            await homeViewModel.getDoctorList()
            
        }
        .alert(isPresented: $homeViewModel.isShowAlert) {
            Alert(title: Text(homeViewModel.alertMessage), message: Text(homeViewModel.alertMessage), dismissButton: .cancel(Text("Ok")))
        }
        
    }
}

#Preview {
    HomeView()
}
