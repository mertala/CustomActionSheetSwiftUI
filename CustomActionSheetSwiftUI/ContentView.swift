//
//  ContentView.swift
//  CustomActionSheetSwiftUI
//
//  Created by Mert Ala on 21.01.2020.
//  Copyright © 2020 Mert Ala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
    @State var show = false
   
    var body: some View {
        VStack(spacing:15) {
        
        Text("Custom Action Sheet on SwiftUI")
            .bold()
           
            
            Button(action: {
                
                self.show.toggle()
               
            }) {
                Text("Actionsheet")
            }
            VStack {
               Spacer()
                CustomActionSheet().offset(y:self.show ? 0 : UIScreen.main.bounds.height)
            }.background((self.show ? Color.black.opacity(0.3) : Color.clear).edgesIgnoringSafeArea(.all).onTapGesture {
                self.show.toggle()
            })
            .edgesIgnoringSafeArea(.bottom)
            
        }.animation(.default)
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CustomActionSheet: View {
    
    @State var show1 = false
    @State var show2 = false
    @State var show3 = false
    @State var show4 = false
    @State var count = 0
    var  body : some View  {
        
        VStack(spacing: 15) {
            
            Toggle(isOn: self.$show1) {
               
                Text("Notification")
                      }
            Toggle(isOn: self.$show2) {
                         
                Text("Comment")
                      }
            Toggle(isOn: self.$show3) {
                         
                Text("Likes")
                      }
            Toggle(isOn: self.$show4) {
                         
                Text("Subs")
            }
            Stepper(onIncrement: {
                self.count +=  1
            }, onDecrement: {
                if  self.count  != 0 {
                    self.count -= 1
                }
            }) {
                Text("notification limit =\(self.count)")
            }
            
        }.padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top,20)
            .background(Color.white)
        .cornerRadius(25)
       
    }

}
