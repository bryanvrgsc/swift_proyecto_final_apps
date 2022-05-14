//
//  ContentView.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var id = UIDevice.current.identifierForVendor!.uuidString
    @State var isLoggedIn: Bool = true
    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            if isLoggedIn {
                Productos()
            } else {
                NavigationView {
                    VStack {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Spacer()
                            .frame(height: 35)
                        TextField("Email", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(3)
                        SecureInputView("Password", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(3)
                        Spacer()
                            .frame(height: 70)
                        Button {
                        }
                        label: {
                            Text("Iniciar sesión")
                        }

                        .frame(width: 200)

                        .padding()
                      
                        .foregroundColor(.white)
                        .background(.yellow)
                        .cornerRadius(10)
                      Spacer()
                          .frame(height: 70)
                    }
                }
                .navigationBarTitle("Inicio de Sesión")
                .navigationBarItems(trailing: BotonRegistrarse)
                .foregroundColor(.blue)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        NavigationLink(
                            destination: Productos(),
                            label: {
                                VStack {
                                    Text("Continuar sin iniciar sesión")
                                        .frame(width: 200)
                                        .padding()
                                        .foregroundColor(.blue)
                                        .background(.white)
                                        .cornerRadius(10)
                                }
                            }
                        )
                    }
                }
            }
        }
    }
}

var BotonRegistrarse: some View {
    NavigationLink(
        destination: SignUp(),
        label: {
            Text("Registrarse")
        })
}

var BotonProductos: some View {
    NavigationLink(
        destination: Productos(),
        label: {
            VStack {
                Text("Continuar ")
                Text("sin iniciar sesión")
                    .frame(width: 200)
                    .padding()
                    .foregroundColor(.blue)
                    .background(.white)
                    .cornerRadius(10)
            }
        })
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
