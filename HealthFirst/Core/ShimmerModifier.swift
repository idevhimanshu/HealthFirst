//
//  ShimmerModifier.swift
//  HealthFirst
//
//  Created by chetu on 25/11/26.
//

import Foundation
import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = -1.5
    var duration: Double = 1.5
    var bounce: Bool = false

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.2),
                            .init(color: .white.opacity(0.6), location: 0.5),
                            .init(color: .clear, location: 0.8)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: geometry.size.width * 2)
                    .offset(x: phase * geometry.size.width)
                }
            )
            .mask(content)
            .onAppear {
                withAnimation(
                    .linear(duration: duration)
                    .repeatForever(autoreverses: bounce)
                ) {
                    phase = 1.5
                }
            }
    }
}

extension View {
    @ViewBuilder
    func shimmering(active: Bool = true, duration: Double = 1.5) -> some View {
        if active {
            modifier(ShimmerModifier(duration: duration))
        } else {
            self
        }
    }
}
