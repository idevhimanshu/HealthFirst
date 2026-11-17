//
//  NotificationSettingView.swift
//  HealthFirst
//
//  Created by chetu on 29/09/26.
//

import SwiftUI

struct NotificationSettingView: View {
    
    @State private var items: [String] = [ "General Notification", "Sound", "Sound Call", "Vibrate", "Special Offers", "Payments", "Promo And Discount", "Cashback"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(items, id: \.self){ item in
                HStack {
                    Text(item)
                        .font(.custom("LeagueSpartan-Regular", size: 20))
                    Toggle("", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color("_2260FF")))
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationBarTitle("Notification Setting")
    }
}

#Preview {
    NotificationSettingView()
}
