//
//  CompletedAppointment.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct CompletedAppointment: View {
    
    var allApointmentViewModel: AllApointmentViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top){
                
                Image("ProfilePhoto")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .cornerRadius(35)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Dr. Olivia Turner, M.D.")
                        .font(.custom("LeagueSpartan-Medium", size: 16))
                        .foregroundStyle(Color("_2260FF"))
                    
                    Text("Dermato-Endocrinology")
                        .font(.custom("LeagueSpartan-Light", size: 14))
                    
                    HStack {
                        AppBadge(icon: "star", title: "5")
                        CircleButton(size: 22, icon: "Heart", iconSize: 10){
                            
                        }
                    }
                }
                .padding(.top, 15)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            
            HStack {
                CardActionButton(title: "Re-Book", theme: .white, action: {
                    
                })
                CardActionButton(title: "Add Review", theme: .primary, action: {
                    allApointmentViewModel.navigateToReviewScreen()
                })
            }
        }
        .padding(17)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("_CAD6FF"))
        .cornerRadius(20)
    }
}

#Preview {
    CompletedAppointment(allApointmentViewModel: AllApointmentViewModel())
}
