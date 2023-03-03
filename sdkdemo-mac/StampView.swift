//
//  StampView.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/2.
//

import SwiftUI

struct StampView: View {
        
        @FetchRequest(
                sortDescriptors: [NSSortDescriptor(keyPath: \CDStamp.address, ascending: true)],
                animation: .default)
        
        private var stamps: FetchedResults<CDStamp>
        
        @State var curStamp:CDStamp?
        @State var showNewStampView = false
        var body: some View {
                HStack{
                        VStack(spacing:20){
                                Button {
                                        showNewStampView = true
                                } label: {
                                        Text("Start Service")
                                                .font(.subheadline)
                                                .foregroundColor(.green)
                                                .frame(width: 60,height: 40)
                                                .border(.green)
                                }.padding(.top, 30).sheet(isPresented: $showNewStampView) {
                                        NewStampView(isPresented: $showNewStampView).fixedSize()
                                }

                                
                                List(stamps, id:\.address, selection: $curStamp) {s in
                                        Text(s.name ?? "").font(.subheadline)
                                }.background(.purple)
                                        .padding(.top, 80)
                                
                        }.background(.red)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                .frame(minWidth: 120.0, maxWidth: 160.0, maxHeight: .infinity)
                        
                        StampDetailView(curStamp: curStamp)
                                .background(.blue)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                
        }
}

struct StampDetailView:View{
        @State var curStamp:CDStamp?
        var body: some View{
                if curStamp == nil{
                        Text("Add New Stamp Info First!!!")
                                .font(.subheadline)
                                .foregroundColor(.green)
                                .frame(width: 120,height: 40)
                                .border(.green)
                }else{
                        VStack{
                                HStack{
                                        Label("Address:", systemImage:"house")
                                        Text(curStamp!.address ?? "").textSelection(.enabled).font(.subheadline)
                                        
                                }
                                
                                HStack{
                                        Label("Name:", systemImage:"signpost.right")
                                        Text(curStamp!.name ?? "").textSelection(.enabled).font(.subheadline)
                                        
                                }
                        }.padding()
                                
                }
        }
}


struct StampView_Previews: PreviewProvider {
        static var obj = CDStamp(context: PersistenceController.shared.container.viewContext)
        static var previews: some View {
                StampView(curStamp: obj)
        }
}
