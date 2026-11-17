//
//  CancelAppointmentView.swift
//  HealthFirst
//
//  Created by Himanshu on 10/10/26.
//

import Foundation
import SwiftUI



struct CancelAppointmentView: View {
    @State private var cancelReasonList: [String] = ["Rescheduling", "Weather Condition", "Unexpacted Work", "Other"]
    @State private var reasonTextField: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.custom("LeagueSpartan-Light", size: 14))
            
            ForEach(cancelReasonList, id: \.self) { item in
                HStack {
                    
                    CustomRadioButton(isSelected: false, action: {
                        
                    })
                    Text(item)
                        .font(.custom("LeagueSpartan-Light", size: 16))
                }
            }
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                .font(.custom("LeagueSpartan-Light", size: 14))
                .foregroundStyle(Color("_2260FF"))
            
            HStack {
                TextField("Enter your reason here..", text: $reasonTextField, axis: .vertical)
                    .lineLimit(7, reservesSpace: true)
                    .foregroundStyle(Color("_2260FF"))
                    
            }
            .padding(16)
            .background(Color("_CAD6FF"))
            .cornerRadius(18)
            
            
            CustomButton {
                
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Cancel Appointment")
                    .font(.custom("LeagueSpartan-Semibold", size: 24))
                    .foregroundStyle(Color("_2260FF"))
            }
        }
    }
}

#Preview {
    CancelAppointmentView()
}

struct CustomRadioButton: View {
    var isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Circle()
                .fill(Color.clear)
                .stroke(Color("_2260FF"), lineWidth: 1)
                .frame(width: 20, height: 20)
            
                .overlay {
                    Circle()
                        .fill(Color.clear)
                        .stroke(Color("_2260FF"), lineWidth: 1)
                        .frame(width: 10, height: 10)
                }
        }
    }
}
