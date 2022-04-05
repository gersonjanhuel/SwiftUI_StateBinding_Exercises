//
//  ExerciseA_View.swift
//  NC2Sample2022
//
//  Created by Gerson Janhuel on 05/04/22.
//

import SwiftUI

struct ExerciseA_View: View {
    
    @State private var isLightOn: Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(isLightOn ? .purple : .darkGray)
                    .ignoresSafeArea()
                
                VStack {
                    Text("The light is \((isLightOn) ? "ON 🎉": "OFF 😴")")
                        .font(.title)
                        .padding(.bottom, 10)
                        .foregroundColor(isLightOn ? .white : .black)
                    
                    NavigationLink(destination: SwitcherView(isLightOn: $isLightOn)) {
                        
                        Text("Settings")
                            .padding()
                            .foregroundColor(isLightOn ? .white : .black)
                            .background(.blue)
                            .cornerRadius(30)
                            
                            
                    }
                }
            }
        }
        
    }
}

struct SwitcherView: View {
    @Binding var isLightOn: Bool
    
    var body: some View {

        Toggle("Lamp Switch 💡", isOn: $isLightOn)
            .padding(.horizontal, 50)
        
    }
}

struct ExerciseA_View_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseA_View()
    }
}
