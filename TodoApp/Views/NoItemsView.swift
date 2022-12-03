//
//  NoItemsView.swift
//  TodoApp
//
//  Created by macOs on 3/12/2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    let secondaryColor = Color("SecondaryColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("There is no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click on the add button to add a new item to your list")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add new item.")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 45)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal,animate ?  40 :  50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(color: animate ? secondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius:animate ? 30 : 10, x: 0, y: animate ? 50 : 30)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(10)
            .onAppear(perform: addAnimation)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}
