//
//  Carrito.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct Carrito: View {
    @EnvironmentObject var vistamodelo: ViewModel
    @Binding var userid: String
    var body: some View {
        let colors: [Color] = [.orange, .blue, .yellow]

        ScrollView {
            VStack {
                ForEach(vistamodelo.carrito, id: \.id_producto) { item in
                    VistaElementoCarrito(
                        title: item.nombre ?? "",
                        foto: item.imagen_principal ?? "",
                        textColor: .white,
                        bgColor: colors[toInt(s: item.id_producto) % colors.count],
                        precio: item.precio ?? "",
                        userid: userid,
                        productoid: item.id_producto ?? "",
                        cantidad: item.cantidad ?? ""
                    )
                }
            }.padding(.horizontal)
        }
        .navigationTitle("Carrito")
        .navigationBarItems(trailing: BotonActualizar)
        .onAppear {
            let params: [String: Any] = [
                "username": self.userid,
            ]
            vistamodelo.postCarrito(parameters: params)
        }
    }

    var BotonActualizar: some View {
        Button(action: {
                   let params: [String: Any] = [
                       "username": self.userid,
                   ]
                   vistamodelo.postCarrito(parameters: params)
               },
               label: {
                   Text("Actualiza")
               })
    }
}

struct Carrito_Previews: PreviewProvider {
    static var previews: some View {
        Carrito(userid: .constant(""))
    }
}

struct VistaElementoCarrito: View {
    @EnvironmentObject var vistamodelo: ViewModel
    var title: String
    var foto: String
    var textColor: Color
    var bgColor: Color
    var precio: String
    var userid: String
    var productoid: String
    var cantidad: String

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: foto)) {
                image in image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
            } placeholder: {
                ProgressView()
            }
            .background(.white)
            .cornerRadius(10)
            Spacer()

            VStack {
                Spacer()
                Text(title)
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Spacer()
                    .frame(height: 10)
                Text("$\(precio)")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Spacer()
                    .frame(height: 10)
                Text(cantidad)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Spacer()
                    .frame(height: 10)

                Spacer()
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
