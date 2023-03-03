//
//  BarView.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/2.
//

import SwiftUI

struct BarView_Previews: PreviewProvider {
        static var previews: some View {
                MenuItemView(image: "contact", me: .mail, selectedMenu: Binding.constant(.mail))
        }
}

struct MenuItemView:View{
        @State var image: String
        @State var me: MenuItem
        @Binding var selectedMenu: MenuItem
        
        var body: some View {
                
                ZStack {
                        RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(
                                        self.selectedMenu == self.me ? Color("sibebarSelected") : Color("sibebarBackGround")
                                ) .frame(width:24.0, height: 24.0).padding()
                        Image(systemName: image)
                                .resizable()
                                .frame(width: 24, height: 24).padding()
                        
                }.onTapGesture {
                        self.selectedMenu = self.me
                }
        }
}
