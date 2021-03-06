//
//  VistaModeloAPI.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import Foundation

class ViewModel: ObservableObject {
  @Published var resultado = [DataResultado]()
  @Published var carrito = [DataResultado]()
  @Published var regreso = DataModel(error: false, message: "", data: [DataResultado(id_producto: "", nombre: "", descripcion: "", cantidad: "", id_carrito: "", imagen_principal: "", precio: "", id_usuario: "", usuario: "", password: "", nombres: "", apellido_paterno: "", apellido_materno: "", suscripcion: false, direccion: "", admin: false)])
    let prefixUrl = "https://apps2-final-tienda.glitch.me"

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
                      self.resultado = result.data ?? [DataResultado(id_producto: "", nombre: "", descripcion: "", cantidad: "", id_carrito: "", imagen_principal: "", precio: "", id_usuario: "", usuario: "", password: "", nombres: "", apellido_paterno: "", apellido_materno: "", suscripcion: false, direccion: "", admin: false)]
                    }
                } else {
                    print("No hay datos")
                }
            } catch let JsonError {
                print("Error en JSON GetProductos ", JsonError.localizedDescription)
            }
        }.resume()
    } // fin de getProductos

    // MARK: - postLogIn

    func postLogIn(parameters: [String: Any]) {
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
                print("Error ", error?.localizedDescription ?? "")
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
            } catch let JsonError {
                print("Error en JSON LogIn", JsonError.localizedDescription)
            }

        }.resume()
    } // fin de postLogIn

    // MARK: - postSignUp

    func postSignUp(parameters: [String: Any]) {
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
                print("Error ", error?.localizedDescription ?? "")
                return
            }

            do {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
                    DispatchQueue.main.async {
                        self.regreso = result
                    } // fin async
                } else {
                    print("No hay datos")
                }
            } // fin del do
            catch let JsonError {
                print("Error en json SignUp", JsonError.localizedDescription)
            }

        }.resume() // fin dataTask
    } // fin de postLogIn

  // MARK: - postAgregarProducto

  func postAgregarProductoCarrito(parameters: [String: Any]) {
      guard let url = URL(string: "\(prefixUrl)/agregar_producto_carrito") else {
          print("Error URL")
          return
      }
      let data = try! JSONSerialization.data(withJSONObject: parameters)
      print(parameters)
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.httpBody = data
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")

      URLSession.shared.dataTask(with: request) { data, _, error in

          if error != nil {
              print("Error ", error?.localizedDescription ?? "")
              return
          }

          do {
              if let d = data {
                  let result = try JSONDecoder().decode(DataModel.self, from: d)
                  DispatchQueue.main.async {
                      self.regreso = result
                  } // fin async
              } else {
                  print("No hay datos")
              }
          } // fin del do
          catch let JsonError {
              print("Error en json AgregaProductos", JsonError.localizedDescription)
          }

      }.resume() // fin dataTask
  } // fin de postLogIn

  // MARK: - postCarrito

  func postCarrito(parameters: [String: Any]) {
      guard let url = URL(string: "\(prefixUrl)/carrito") else {
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
              print("Error ", error?.localizedDescription ?? "")
              return
          }

          do {
              if let d = data {
                  let result = try JSONDecoder().decode(DataModel.self, from: d)
                  DispatchQueue.main.async {
                    self.carrito = result.data ?? [DataResultado(id_producto: "", nombre: "", descripcion: "", cantidad: "", id_carrito: "", imagen_principal: "", precio: "", id_usuario: "", usuario: "", password: "", nombres: "", apellido_paterno: "", apellido_materno: "", suscripcion: false, direccion: "", admin: false)]
                  }
              } else {
                  print("No hay datos")
              }
          } catch let JsonError {
              print("Error en JSON Carrito", JsonError.localizedDescription)
          }

      }.resume()
  } // fin de postLogIn

  // MARK: - postCarritoMas

  func postCarritoMenos(parameters: [String: Any]) {
      guard let url = URL(string: "\(prefixUrl)/carritomenos") else {
          print("Error URL")
          return
      }
      let data = try! JSONSerialization.data(withJSONObject: parameters)
      print(parameters)
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.httpBody = data
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")

      URLSession.shared.dataTask(with: request) { data, _, error in

          if error != nil {
              print("Error ", error?.localizedDescription ?? "")
              return
          }

          do {
              if let d = data {
                  let result = try JSONDecoder().decode(DataModel.self, from: d)
                  DispatchQueue.main.async {
                      self.regreso = result
                  } // fin async
              } else {
                  print("No hay datos")
              }
          } // fin del do
          catch let JsonError {
              print("Error en json AgregaProductos", JsonError.localizedDescription)
          }

      }.resume() // fin dataTask
  } // fin de postLogIn

  // MARK: - postCarritoBorrar

  func postCarritoBorrar(parameters: [String: Any]) {
      guard let url = URL(string: "\(prefixUrl)/carritoborrar") else {
          print("Error URL")
          return
      }
      let data = try! JSONSerialization.data(withJSONObject: parameters)
      print(parameters)
      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.httpBody = data
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")

      URLSession.shared.dataTask(with: request) { data, _, error in

          if error != nil {
              print("Error ", error?.localizedDescription ?? "")
              return
          }

          do {
              if let d = data {
                  let result = try JSONDecoder().decode(DataModel.self, from: d)
                  DispatchQueue.main.async {
                      self.regreso = result
                  } // fin async
              } else {
                  print("No hay datos")
              }
          } // fin del do
          catch let JsonError {
              print("Error en json AgregaProductos", JsonError.localizedDescription)
          }

      }.resume() // fin dataTask
  } // fin de postLogIn

}
