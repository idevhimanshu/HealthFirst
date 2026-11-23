//
//  AllPresentationView.swift
//  HealthFirst
//
//  Created by chetu on 07/10/26.
//

import SwiftUI

struct AllAppointmentView: View {
    
    @State private var selectedFilterButton: AppointmentFilterButton = .completed
    @State private var allApointmentViewModel: AllApointmentViewModel = AllApointmentViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            Text("All Appointment")
                .font(.custom("LeagueSpartan-Semibold", size: 24))
                .foregroundStyle(Color("_2260FF"))
            HStack {
                ForEach(AppointmentFilterButton.allCases){ item in
                    FilterTabButton(title: item.rawValue, isSelected: selectedFilterButton.rawValue == item.rawValue){
                        selectedFilterButton = item
                    }
                }
            }
            .padding(.bottom, 15)
            switch selectedFilterButton {
            case .completed:
                CompletedAppointment(allApointmentViewModel: allApointmentViewModel)
            case .upcoming:
                UpcomingAppointmentView(allApointmentViewModel: allApointmentViewModel)
            case .cancelled:
                CancledAppointmentView()
            }
        }
        .padding(16)
        onAppear(perform: {
            KeychainManager.shared.deleteAll()
        })
        .navigationDestination(isPresented: $allApointmentViewModel.isNavigateToReviewScreen) {
            ReviewScreen()
        }
        .navigationDestination(isPresented: $allApointmentViewModel.isNavigateToCancelScreen) {
            CancelAppointmentView()
        }
    }
}

#Preview {
    AllAppointmentView()
}









