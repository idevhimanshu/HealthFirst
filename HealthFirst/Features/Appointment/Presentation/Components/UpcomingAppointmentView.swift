//
//  UpcomingAppointmentView.swift
//  HealthFirst
//
//  Created by chetu on 09/10/26.
//

import SwiftUI

struct UpcomingAppointmentView: View {
    var allApointmentViewModel: AllApointmentViewModel
    var body: some View {
        VStack(spacing: 10) {
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
                }
                .padding(.top, 15)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            
            HStack(spacing: 12) {
                AppBadge(icon: "calender_icon", title: "Sunday, 12 June")
                AppBadge(icon: "clock_icon", title: "9:30 AM - 10:00 AM")
            }
            
            HStack(spacing: 12) {
                CardActionButton(title: "Details", theme: .primary, action: {
                    
                })
                CircleButton(size: 26, icon: "CheckMark", iconSize: 10) {
                    
                }
                CircleButton(size: 26, icon: "CrossMark", iconSize: 10) {
                    allApointmentViewModel.navigateToCancelScreen()
                }
            }
        }
        .padding(17)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("_CAD6FF"))
        .cornerRadius(20)
    }
}

#Preview {
    UpcomingAppointmentView(allApointmentViewModel: AllApointmentViewModel())
}
