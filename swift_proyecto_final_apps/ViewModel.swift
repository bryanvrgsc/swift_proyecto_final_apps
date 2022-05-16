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
                    }
                } else {
                    print("no hay datos")
                }
            }
            catch let JsonError {
                print("error en json ", JsonError.localizedDescription)
            }
        }.resume()
    } // fin de getProductos

    // MARK: - postLogIn

    func postLogIn(parameters: [String: Any])
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
                    DispatchQueue.main.async {
                        self.regreso = result
                    }
                } else {
                    print("No hay datos")
                }
            }
            catch let JsonError {
                print("error en json creaFruits", JsonError.localizedDescription)
            }

        }.resume()
    } // fin de postLogIn

  // MARK: - postSignUp

  func postSignUp(parameters: [String: Any])
  {
      guard let url = URL(string: "\(prefixUrl)/signup") else {
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
                  DispatchQueue.main.async {
                      self.regreso = result
                  }// fin async
              } else {
                  print("No hay datos")
              }
          } // fin del do
          catch let JsonError {
              print("error en json creaFruits", JsonError.localizedDescription)
          }

      }.resume() // fin dataTask
  } // fin de postLogIn
}
