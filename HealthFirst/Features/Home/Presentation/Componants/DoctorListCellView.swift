//
//  DoctorListCellView.swift
//  HealthFirst
//
//  Created by chetu on 25/11/26.
//

import SwiftUI

struct DoctorListCellView: View {
    
    let doctor: Doctor
    
    var body: some View {
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

#Preview {
    DoctorListCellView(doctor: Doctor(id: 1, gender: "Male", specializaiton: "Cardiology", rating: 3, favorite: false, image: nil, name: "Vivek", commentCount: 5))
}
