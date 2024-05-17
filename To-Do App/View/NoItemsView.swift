//
//  NoItemsView.swift
//  To-Do App
//
//  Created by elluminati on 17/05/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animater : Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10.0){
                Text("There is the no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("are you a productive person? I think you should click the add button and add a bunch of itmes to your todo list!")
                    .padding(.bottom , 20)
                NavigationLink(destination: AddView(),
                               label: {
                    Text("Add Something 🥳")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animater ? Color.red :  Color.blue)
                        .cornerRadius(12)
                })
                .padding(.horizontal, animater ? 30 : 50)
                .scaleEffect(animater ? 1.1 : 1.0)
                .offset(y: animater ? -6 : 0)
                .shadow(
                    color: animater ? Color.red.opacity(0.7) : Color.blue.opacity(0.7),
                    radius: 10,x: 0, y: 0)
                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animater else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animater.toggle()
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
