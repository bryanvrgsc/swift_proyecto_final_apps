//
//  Productos.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct Productos: View {
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
                  .navigationBarItems(leading: BotonUsuario, trailing: BotonCarrito)
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
  var BotonUsuario: some View {
      NavigationLink(
        destination: Perfil(),
          label: {
              Label("LogIn",
                    systemImage: "person.crop.circle")
                  .font(.system(size: 25))
                  .foregroundColor(Color.red)
          })
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

struct Productos_Previews: PreviewProvider {
    static var previews: some View {
        Productos()
    }
}
