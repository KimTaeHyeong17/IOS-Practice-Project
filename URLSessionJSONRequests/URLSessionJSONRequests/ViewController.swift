//
//  ViewController.swift
//  URLSessionJSONRequests
//
//  Created by 김태형 on 29/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBAction func onGetTab(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")else{return}
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response{
                print(response)
            }
            if let data = data{
                print(data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch{
                    print(error)
                }
            }
            }.resume()
        
    }
    
    //post doens't work!!
    @IBAction func onPostTab(_ sender: UIButton) {
        
        let parameters = ["id":"uuzaza@naver.com","pw":"1q2w3e4r"]
        guard let url = URL(string:"https://taky.co.kr/login/app_login") else{return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])else{
            return}
        request.httpBody = httpBody
        
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
                
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [] )
                    print(json)
                }catch{
                    print(error)
                }
            }
            }.resume()
        
        
        
        
    }
    
}

