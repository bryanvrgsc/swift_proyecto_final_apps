//
//  Productos.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct Productos: View {
    @EnvironmentObject var vistamodelo: ViewModel
    var body: some View {
        let colors: [Color] = [.orange, .red, .green, .blue]

        ScrollView {
            ForEach(vistamodelo.resultado, id: \.id_producto) { item in

                VStack {
                    NavigationLink(
                        destination: VistaProducto(
                            producto: item.nombre ?? "",
                            foto: item.imagen_principal ?? "",
                            cantidad: item.cantidad ?? ""
                        ),
                        label: {
                            Producto(
                                title: item.nombre ?? "",
                                foto: item.imagen_principal ?? "",
                                textColor: .black,
                                bgColor: colors[toInt(s: item.id_producto) % colors.count],
                                precio: item.precio ?? ""
                            )
                        }
                    )
                }.padding(.horizontal)
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
            .onAppear {
                vistamodelo.getProductos()
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

struct Productos_Previews: PreviewProvider {
    static var previews: some View {
        Productos()
    }
}

struct Producto: View {
    var title: String
    var foto: String
    var textColor: Color
    var bgColor: Color
    var precio: String

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: foto)) {
                image in image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            } placeholder: {
                ProgressView()
            }

            VStack {
                HStack {
                    Spacer()
                    Text(title)
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(textColor)
                }
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
