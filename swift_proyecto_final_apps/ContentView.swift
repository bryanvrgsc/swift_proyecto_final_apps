//
//  ContentView.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vistamodelo: ViewModel
    @State var id = UIDevice.current.identifierForVendor!.uuidString
    @State var isLoggedIn: Bool = false
    @State var user_id = ""
    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            if isLoggedIn {
                ScrollView {
                    VStack {
                        HeaderView(title: "Cuenta")
                      HStack {

                        NavigationLink(
                            destination: Productos(userid: $user_id),
                            label: {
                              Image("logo")
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 200)
                            }
                        )

                        }
                        HStack {
                            IconoVista(title: "Cuenta", textColor: .white, bgColor: .purple, icon: "person.fill")
                            IconoVista(title: "Dirección", textColor: .white, bgColor: .gray, icon: "house.fill")
                        }
                        HStack {
                            IconoVista(title: "Membresía", textColor: .white, bgColor: .orange, icon: "wallet.pass")
                            IconoVista(title: "WishList", textColor: .white, bgColor: .blue, icon: "heart.fill")
                        }
                        HStack {
                            IconoVista(title: "Historial", textColor: .white, bgColor: .green, icon: "clock.arrow.circlepath")
                            IconoVista(title: "Método de Pago", textColor: .white, bgColor: .brown, icon: "creditcard.fill")
                        }
                        HStack {
                            IconoVista(title: "Seguridad", textColor: .white, bgColor: .yellow, icon: "lock.shield.fill")
                            Button {
                                isLoggedIn = false
                            } label: {
                                IconoVista(title: "Cerrar sesión", textColor: .white, bgColor: .red, icon: "rectangle.portrait.and.arrow.right")
                            }
                        }
                        Spacer()
                            .frame(height: 35)

                    }.padding(.horizontal)
                }
                .navigationBarItems(trailing: BotonCarrito.environmentObject(vistamodelo))
                .toolbar {
                    ToolbarItemGroup(
                        placement: .principal) {
                          NavigationLink(
                              destination: Productos(userid: $user_id),
                              label: {
                                  VStack {
                                    Image("logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200)
                                  }
                              }
                          )
                    }
                }
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
                            let params: [String: Any] = [
                                "username": self.email,
                                "password": self.password,
                            ]
                            vistamodelo.postLogIn(parameters: params)
                            if vistamodelo.regreso.message ?? "NO VALIDO" == "VALIDADO" {
                              isLoggedIn = true
                              user_id = vistamodelo.regreso.data?[0].id_usuario ?? ""
                            }
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
                            destination: ProductosSinLogin(),
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
  var BotonCarrito: some View {
      NavigationLink(
        destination: Carrito(userid: $user_id),
          label: {
              Label("Carrito",
                    systemImage: "cart.fill")
                  .font(.system(size: 25))
                  .foregroundColor(Color.orange)
          })
  }
}

var BotonRegistrarse: some View {
    NavigationLink(
        destination: SignUp(),
        label: {
            Text("Registrarse")
        })
}



var BotonProductosSinLogIn: some View {
    NavigationLink(
        destination: ProductosSinLogin(),
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

struct HeaderView: View {
    var title: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.black)
            }

            Spacer()
        }
        .padding()
    }
}

struct IconoVista: View {
    var title: String
    var textColor: Color
    var bgColor: Color
    var icon: String?

    var body: some View {
        VStack {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }

            Text(title)
                .font(.system(.subheadline, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
