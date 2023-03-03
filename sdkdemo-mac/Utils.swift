//
//  Utils.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/3.
//

import SwiftUI
func taskSleep(seconds:Int)async{
        try? await Task.sleep(nanoseconds: UInt64(seconds) * 1_000_000_000)
}

struct CircularWaiting:View{
        @Binding var isPresent: Bool
        @Binding var tipsTxt: String
        @State var color:Color = .orange
        let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        @State private var progressVal = 0
        
        var body: some View {
                if isPresent{
                        ProgressView(tipsTxt, value: Float64(progressVal), total: 100)
                                .progressViewStyle(CustomCircularWaitingViewStyle(color: $color))
                                .onReceive(timer) { _ in
                                        progressVal += 10
                                        progressVal = progressVal % 100
                                }
                }
        }
        
}
struct CustomCircularWaitingViewStyle: ProgressViewStyle {
        
        @Binding var color: Color
        
        func makeBody(configuration: Configuration) -> some View {
                ZStack {
                        Circle()
                                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                                .stroke(color, style: StrokeStyle(lineWidth: 3, dash: [10, 5]))
                                .rotationEffect(.degrees(-90))
                                .frame(width: 200)
                        
                        configuration.label
                                .fontWeight(.bold)
                                .foregroundColor(color)
                                .frame(width: 180)
                }
        }
}
struct CheckingView:View{
        @Binding var state:TripState
        
        var body: some View{
                switch state {
                case .start:
                        EmptyView()
                case .success:
                        Label("Checked", systemImage: "checkmark.circle.fill").foregroundColor(Color.green)
                case .failed:
                        Label("Checked", systemImage: "checkmark.circle.badge.xmark.fill").foregroundColor(Color.red)
                }
        }
}
enum TripState{
        case start
        case success
        case failed
}
