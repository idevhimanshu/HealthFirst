//
//  HelpCenterView.swift
//  HealthFirst
//
//  Created by chetu on 07/10/26.
//

import SwiftUI



struct HelpCenterView: View {
    
   
    
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Text("Help Center")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundColor(.white)
                
                Text("How can we help you")
                    .font(.custom("LeagueSpartan-Regular", size: 16))
                    .foregroundColor(.white)
                
                HStack(alignment: .center) {
                    Image("SearchIcon")
                    Text("Search...")
                        .font(.custom("LeagueSpartan-Regular", size: 16))
                        .foregroundStyle(Color("_CAD6FF"))
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(50)
                
            }
            .padding(25)
            .background(Color("_2260FF"))
            
            HStack(spacing: 20) {
                HStack {
                    Text("FAQ")
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                        .foregroundStyle(Color("_FFFFFF"))
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .top)
                .background(Color("_2260FF"))
                .cornerRadius(20)
                
                HStack {
                    Text("Contact us")
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                        .foregroundStyle(Color("_2260FF"))
                }
                
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .top)
                .background(Color("_CAD6FF"))
                .cornerRadius(20)
                
                
               
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(16)
            
            HStack(spacing: 20) {
                HStack {
                    Text("Popular Topic")
                        .font(.custom("LeagueSpartan-Medium", size: 14))
                        .foregroundStyle(Color("_FFFFFF"))
                }
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .top)
                .background(Color("_2260FF"))
                .cornerRadius(20)
                
                HStack {
                    Text("General")
                        .font(.custom("LeagueSpartan-Medium", size: 14))
                        .foregroundStyle(Color("_2260FF"))
                }
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .top)
                .background(Color("_CAD6FF"))
                .cornerRadius(20)
                
                HStack {
                    Text("Services")
                        .font(.custom("LeagueSpartan-Medium", size: 14))
                        .foregroundStyle(Color("_2260FF"))
                }
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity, alignment: .top)
                .background(Color("_CAD6FF"))
                .cornerRadius(20)
                
                
               
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(16)
            
           
            VStack(spacing: 15) {
                ForEach (0..<5) {_ in
                    HStack {
                        Text("General")
                            .font(.custom("LeagueSpartan-Light", size: 14))
                            .foregroundStyle(Color("_000000"))
                        Spacer()
                        Image("down_arrow_icon")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .foregroundStyle(Color("_2260FF"))
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .background(Color("_ECF1FF"))
                    .cornerRadius(50)
                }
            }
            .padding(.horizontal, 16)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
}

#Preview {
    HelpCenterView()
}
