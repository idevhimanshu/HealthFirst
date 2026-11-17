//
//  NotificationView.swift
//  HealthFirst
//
//  Created by Himanshu on 10/10/26.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack(spacing: 30) {
            ForEach(0..<5){_ in
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundStyle(Color("_2260FF"))
                        .overlay {
                            Image("calender_icon")
                                .foregroundStyle(Color("_FFFFFF"))
                        }
                    VStack(alignment: .leading) {
                        Text("Schedule Appointment")
                            .font(.custom("LeagueSpartan-Medium", size: 20))
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.custom("LeagueSpartan-Light", size: 12))
                    }
                    
                    Text("5 M")
                }
            }
        }
        .padding(16)
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Notification")
                    .font(.custom("LeagueSpartan-SemiBold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }
    }
}

#Preview {
    NotificationView()
}
