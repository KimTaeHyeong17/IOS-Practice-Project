//
//  ViewController.swift
//  AlamofireProject
//
//  Created by 김태형 on 29/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //                AF.request("https://taky.co.kr/login/app_login").responseJSON { response in
        //                    print("Request: \(String(describing: response.request))")   // original url request
        //                    print("Response: \(String(describing: response.response))") // http url response
        //                    print("Result: \(response.result)")                         // response serialization result
        //
        //
        //                    switch response.result {
        //                    case let .success(value): print(value)
        //                    case let .failure(error): print(error)
        //                    }
        //
        //                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        //                        print("Data: \(utf8Text)") // original server data as UTF8 string
        //                    }
        //                }
        
//        let urlString = "https://taky.co.kr/login/app_login"
//                AF.request(urlString,method: .post, parameters: ["id": "uuzaza@naver.com","pw": "1q22w3e4r"],encoding: JSONEncoding.default ,headers: nil).responseJSON{
//                    response in
//                    switch response.result{
//                    case .success:
//                        print(response)
//                        print(response.description)
//
//                        break
//
//                    case .failure(let error):
//                        print(error)
//
//                    }
//
//                }
//
        let parameters = ["id":"uuzaza","pw":"1q2w3e4r"]
    
        makePostCall()
    }
    

    func makePostCall() {
        let todosEndpoint: String = "https://taky.co.kr/login/app_login"
        guard let todosURL = URL(string: todosEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.httpMethod = "POST"
        let newTodo: [String: String] = ["id": "uuzaza@naver.com", "pw": "1q2w3e4r"]
        let jsonTodo: Data
        do {
            jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
            todosUrlRequest.httpBody = jsonTodo
        } catch {
            print("Error: cannot create JSON from todo")
            return
        }

        let session = URLSession.shared
        let task = session.dataTask(with: todosUrlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling POST on /todos/1")
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }

            // parse the result as JSON, since that's what the API provides
            do {
                guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
                                                                          options: []) as? [String: Any] else {
                                                                            print("Could not get JSON from responseData as dictionary")
                                                                            return
                }
                print("The todo is: " + receivedTodo.description)

                guard let todoID = receivedTodo["code"] as? Int else {
                    print("Could not get todoID as int from JSON")
                    return
                }
                print("The ID is: \(todoID)")
            } catch  {
                print("error parsing response from POST on /todos")
                return
            }
        }
        task.resume()
    }

    func makeDeleteCall() {
        let firstTodoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        var firstTodoUrlRequest = URLRequest(url: URL(string: firstTodoEndpoint)!)
        firstTodoUrlRequest.httpMethod = "DELETE"

        let session = URLSession.shared

        let task = session.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on /todos/1")
                return
            }
            print("DELETE ok")
        }
        task.resume()
    }


    
}

