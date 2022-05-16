//
//  VistaModeloAPI.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var resultado = [DataResultado]()
    @Published var regreso = DataModel(error: false, message: "", data: [DataResultado(id_producto: "", nombre: "", descripcion: "", cantidad: "", imagen_principal: "", precio: "", id_usuario: "", usuario: "", password: "", nombres: "", apellido_paterno: "", apellido_materno: "", suscripcion: false, direccion: "", admin: false)])
    let prefixUrl = "https://apps2-final-tienda.glitch.me"

//    init() {
//        getProductos()
//    }

    // MARK: - getProductos

    func getProductos() {
        guard let url = URL(string: "\(prefixUrl)/productos") else {
            print("Error URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in

            if error != nil {
                print("Error ", error?.localizedDescription ?? "")
                return
            }

            do {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.resultado = result.data ?? [DataResultado(id_producto: "", nombre: "", descripcion: "", cantidad: "", imagen_principal: "", precio: "", id_usuario: "", usuario: "", password: "", nombres: "", apellido_paterno: "", apellido_materno: "", suscripcion: false, direccion: "", admin: false)]
                    } // fin async
                } // fin data
                else {
                    print("no hay datos")
                }
            } // fin del do
            catch let JsonError {
                print("error en json ", JsonError.localizedDescription)
            }

        }.resume() // fin dataTask
    } // fin de getProductos

    // MARK: - creaFrutas

    func postLogIn(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "\(prefixUrl)/login") else {
            print("Error URL")
            return
        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, _, error in

            if error != nil {
                print("error ", error?.localizedDescription ?? "")
                return
            }

            do {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
//                  print("Parametros \(result)")
                    DispatchQueue.main.async {
//                      print("El Resultado es \(result)")
                        self.regreso = result 

                    }// fin async
                } // fin data
                else {
                    print("No hay datos")
                }
            } // fin del do
            catch let JsonError {
                print("error en json creaFruits", JsonError.localizedDescription)
            }

        }.resume() // fin dataTask
    } // fin de creaFruits
}
