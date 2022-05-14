//
//  ContentView.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack {
                Text("Test")
            }
            .navigationTitle("Tienda")
            .foregroundColor(.red)
            .navigationViewStyle(DefaultNavigationViewStyle())
            .toolbar {
                ToolbarItemGroup(
                    placement: .navigationBarLeading) {
                    Button {
                        print("Carrito")
                    } label: {
                        Label("Carrito",
                        systemImage: "person.crop.circle")
                        .font(.system(size: 25))
                        .foregroundColor(Color.red)
                    }
                }
                ToolbarItemGroup(
                    placement: .principal) {
                    Button(action: {
                        print("button pressed")
                    }) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                }
                ToolbarItemGroup(
                    placement: .navigationBarTrailing) {
                    Button {
                        print("Carrito")
                    } label: {
                        Label("Carrito",
                        systemImage: "cart.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color.orange)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
