//
//  Productos.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct ProductosSinLogIn: View {
    var body: some View {
              let colors: [Color] = [.red, .green, .blue]
      ScrollView {
                      ScrollViewReader { _ in
                          ForEach(0 ..< 100) { i in
                              Text("Example \(i)")
                                  .font(.title)
                                  .frame(width: 200, height: 200)
                                  .background(colors[i % colors.count])
                                  .id(i)
                          }
                      }
                  }
                  .navigationTitle("Tienda")
                  .foregroundColor(.red)
                  .navigationViewStyle(DefaultNavigationViewStyle())
                  .navigationBarItems(trailing: BotonCarrito)
                  .toolbar {
                      ToolbarItemGroup(
                          placement: .principal) {
                          Button(action: {
                              print("Logo")
                          }) {
                              Image("logo")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(height: 50)
                          }
                      }
                  }
      
    }

  var BotonCarrito: some View {
      NavigationLink(
          destination: Carrito(),
          label: {
              Label("Carrito",
                    systemImage: "cart.fill")
                  .font(.system(size: 25))
                  .foregroundColor(Color.orange)
          })
  }
}

struct ProductosSinLogIn_Previews: PreviewProvider {
    static var previews: some View {
        ProductosSinLogIn()
    }
}
