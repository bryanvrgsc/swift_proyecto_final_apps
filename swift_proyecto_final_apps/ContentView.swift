//
//  ContentView.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct ContentView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
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

                NavigationLink(
                    destination: Menu(),
                    label: {
                        VStack {
                            Text("Continuar sin iniciar sesión")
                            .frame(width: 200)
                            .padding()
                            .foregroundColor(.blue)
                            .background(.white)
                            .cornerRadius(10)
                        }
                    })


            }.padding()
                .navigationBarTitle("Inicio de Sesión")
                .navigationBarItems(trailing: BotonRegistrarse)
                .foregroundColor(.blue)
        }
        Spacer()
    }

    var BotonRegistrarse: some View {
        NavigationLink(
            destination: SignUp(),
            label: {
                Text("Registrarse")
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SecureInputView: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String

    init(_ title: String, text: Binding<String>) {
        self.title = title
        _text = text
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
}
