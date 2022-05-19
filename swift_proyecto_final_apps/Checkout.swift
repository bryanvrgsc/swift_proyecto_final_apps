//
//  Checkout.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 19/05/22.
//

import SwiftUI

struct Checkout: View {
    @EnvironmentObject var vistamodelo: ViewModel
    @Binding var userid: String
    var body: some View {
        let colors: [Color] = [.orange, .blue, .yellow]
        ScrollView {
            VStack {
                ForEach(vistamodelo.carrito, id: \.id_producto) { item in
                    VistaElementoCheckout(
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

                if vistamodelo.carrito.count > 0 {
                    NavigationLink(
                        destination: Finalizado(),
                        label: {
                            Text("Finalizar compra")
                                .frame(width: 200)
                                .padding()
                                .foregroundColor(.white)
                                .background(.green)
                                .cornerRadius(10)
                        }
                    )
                }
            }.padding(.horizontal)
        }
        .navigationTitle("Checkout")
        .onAppear {
            let params: [String: Any] = [
                "username": self.userid,
            ]
            vistamodelo.postCarrito(parameters: params)
        }
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout(userid: .constant(""))
    }
}

struct VistaElementoCheckout: View {
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
                Text("Subtotal")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Text("$\(Int(cantidad)! * Int(precio)!)")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Spacer()
                    .frame(height: 10)
            }
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
