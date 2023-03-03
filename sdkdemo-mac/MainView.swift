//
//  MainView.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/2.
//

import SwiftUI

enum MenuItem: String, Codable {
        case mail, stamp, setting
        
        var string: String {
                rawValue.capitalized
        }
}

struct MainView: View {
        @Environment(\.managedObjectContext) private var viewContext
        @State private var curMenu: MenuItem = .stamp
        
        var body: some View {
                
                HStack(spacing:0){
                        VStack(spacing:30){
                                MenuItemView(image: "mail", me: .mail, selectedMenu: $curMenu)
                                        .frame(width: 28.0, height: 28.0).padding(.top,30)
                                MenuItemView(image: "swift", me:.stamp, selectedMenu: $curMenu)
                                        .frame(width: 28.0, height: 28.0)
                                MenuItemView(image: "gear", me:.setting, selectedMenu: $curMenu)
                                        .frame(width: 28.0, height: 28.0)
                                Spacer()
                        }.padding()
                                .frame(minWidth: 40.0, maxWidth: 50.0, maxHeight: .infinity)
                                .background(Color("sibebarBackGround"))
                        
                        DetailView(curMenu:$curMenu).frame(maxWidth: .infinity, maxHeight: .infinity).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .frame(minWidth: 1160, minHeight:  460)
        }
}


struct DetailView:View{
        @Binding var curMenu: MenuItem
        var body: some View{
                switch curMenu {
                case .mail:
                        MailDataView()
                case .stamp:
                        StampView()
                case .setting:
                        SettingView()
                }
        }
}


struct MainView_Previews: PreviewProvider {
        static var previews: some View {
                MainView()
        }
}


