//
//  Productos.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct Productos: View {
    @Binding var userid: String
    @EnvironmentObject var vistamodelo: ViewModel

    var body: some View {
        let colors: [Color] = [.orange, .blue, .yellow]

        ScrollView {
            ForEach(vistamodelo.resultado, id: \.id_producto) { item in

                VStack {
                    NavigationLink(
                        destination: VistaProducto(
                            producto: item.nombre ?? "",
                            foto: item.imagen_principal ?? "",
                            precio: item.precio ?? "",
                            cantidad: item.cantidad ?? "",
                            productoid: item.id_producto ?? "",
                            userid: userid
                        ),
                        label: {
                            Producto(
                                title: item.nombre ?? "",
                                foto: item.imagen_principal ?? "",
                                textColor: .white,
                                bgColor: colors[toInt(s: item.id_producto) % colors.count],
                                precio: item.precio ?? "",
                                userid: userid,
                                productoid: item.id_producto ?? ""
                            )
                        }
                    )
                }.padding(.horizontal)
            }
            .navigationTitle("Tienda")
            .foregroundColor(.red)
            .navigationViewStyle(DefaultNavigationViewStyle())
            .navigationBarItems(trailing: BotonCarrito.environmentObject(vistamodelo))
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
            .onAppear {
                vistamodelo.getProductos()
            }
        }
    }

    var BotonCarrito: some View {
        NavigationLink(
            destination: Carrito(userid: $userid),
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
        Productos(userid: .constant(""))
    }
}

struct Producto: View {
    @EnvironmentObject var vistamodelo: ViewModel
    var title: String
    var foto: String
    var textColor: Color
    var bgColor: Color
    var precio: String
    var userid: String
    var productoid: String

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
                Button {
                    let params: [String: Any] = [
                        "username": self.userid,
                        "producto": self.productoid,
                    ]
                    vistamodelo.postAgregarProductoCarrito(parameters: params)
                }
                label: {
                    Text("Agregar al carrito")
                }
                .background(.yellow)
                .cornerRadius(10)

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
