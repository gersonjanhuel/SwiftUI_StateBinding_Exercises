//
//  ExerciseB_View.swift
//  NC2Sample2022
//
//  Created by Gerson Janhuel on 05/04/22.
//

import SwiftUI

// Model/blueprint of SuperHero
struct SuperHero {
    var imageName: String
    var superHeroName: String
    var motto: String
}

struct ExerciseB_View: View {
    
    @State var superHeroes: [SuperHero] = [
        SuperHero(imageName: "profilePic", superHeroName: "The Master Koplo Mixer", motto: "No Koplo No Life"),
        SuperHero(imageName: "profilePic2", superHeroName: "Wonder G", motto: "Nasi Goreng For Lyfe")
    ]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DetailView(superHero: $superHeroes[0])) {
                    CardView(superHero: superHeroes[0])
                }
                
                NavigationLink(destination: DetailView(superHero: $superHeroes[1])) {
                    CardView(superHero: superHeroes[1])
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Super Heroes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct CardView: View {
    var superHero: SuperHero
    
    var body: some View {
        HStack{
            Image(superHero.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .background(.blue)
                .clipShape(Circle())
            
            
            VStack(alignment: .leading) {
                Text(superHero.superHeroName)
                    .font(.title2)
                
                Text(superHero.motto)
                    .font(.subheadline)
                    .italic()
            }
            .padding(.leading, 4)
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
    }
}

struct DetailView: View {
    @Binding var superHero: SuperHero
    
    var body: some View {
        VStack{
            Image(superHero.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .background(.blue)
                .clipShape(Circle())
                .padding(.bottom)
            
            TextField("Super hero name", text: $superHero.superHeroName)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            
            TextField("Super hero motto", text: $superHero.motto)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            
            Spacer()
        }
    }
}

struct ExerciseB_View_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseB_View()
    }
}
