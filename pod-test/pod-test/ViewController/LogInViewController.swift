//
//  ViewController.swift
//  pod-test
//
//  Created by 김태형 on 04/06/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import UIKit
import SVProgressHUD
import NavigationDrawer
import Alamofire

struct Course : Decodable{
    let id : Int?
    let name : String?
    let link : String?
    let imageUrl : String?
}

struct WebsiteDescription : Decodable{
    let name :String
    let description : String
    let courses : [Course]
}
struct Response : Decodable{
    let code :String?
    let message : String?
}



class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        decodeSimpleJson()
        //        decodeSimpleArrayJson()
        //        decodeComplexJson()
        //        decodeWithMissingFields()
        
        
        //progress indicater
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: "Progress")
        SVProgressHUD.dismiss()
        
    }
    
    
    @IBAction func LoginBtn(_ sender: UIButton) {
        attemptLogin(email.text!, password.text!)
    }
    
    
    /** MARK: Login && Networking**/
    func attemptLogin(_ id:String, _ pw:String){
        let api = "https://taky.co.kr"
        let endpoint = "/login/app_login"
        let url = URL(string: api + endpoint)
        let params = ["id" : id,"pw" : pw]
        ApiService.callPost(url: url!, params: params, finish: finishPost)
    }

    func finishPost(message:String, data:Data?) -> Void {
        do{
            if let jsonData = data{
                let parsedData = try JSONDecoder().decode(Response.self,from:jsonData)
                if parsedData.code == "S01"{ //로그인 성공
                    if let code = parsedData.code{
                        print(code)
                        DispatchQueue.main.sync {
                            performSegue(withIdentifier: "homeSegue", sender: nil)
                        }
                    }
                }else{ //로그인 실패
                    if let msg = parsedData.message{
                        makeAlertDialog(msg,self)
                    }
                }
            }
        }
        catch{
            print("error")
        }
    }
    
    /** MARK: AlertView **/
    func makeAlertDialog(_ msg :String,_ viewController : UIViewController){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "로그인", message: msg, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
                //implement method
            
            }
            alert.addAction(alertAction)
            viewController.present(alert,animated: true,completion: nil)
        }
        
    }
    
    /** MARK: Json Decoder **/
    func decodeSimpleJson(){
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string:jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //check response stateus 200 ok
            guard let data = data else{return}
            
            //            let dataAsString = String(data : data,encoding: .utf8)
            //            print(dataAsString!)
            
            do {
                let course = try
                    JSONDecoder().decode(Course.self, from: data)
                print(course.name!)
                
            }catch{
                print("error")
            }
            
            }.resume()
    }
    
    func decodeSimpleArrayJson(){
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string:jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //check response stateus 200 ok
            guard let data = data else{return}
            
            //            let dataAsString = String(data : data,encoding: .utf8)
            //            print(dataAsString!)
            
            do {
                let courses = try
                    JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
                
            }catch{
                print("error")
            }
            
            }.resume()
        
        
    }
    
    func decodeComplexJson(){
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string:jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            //            let dataAsString = String(data : data, encoding : .utf8)
            //            print(dataAsString!)
            
            do {
                let websiteDescription = try
                    JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.name, websiteDescription.description)
                for index in 0..<websiteDescription.courses.count {
                    print(websiteDescription.courses[index].name! + " : " + websiteDescription.courses[index].link!)
                }
            }catch {
                print("error")
            }
            }.resume()
        
    }
    
    func decodeWithMissingFields(){ //add ? to struct variable ==>
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string:jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            
            //            let dataAsString = String(data : data, encoding : .utf8)
            //            print(dataAsString!)
            
            do {
                let courses = try
                    JSONDecoder().decode([Course].self, from: data)
                for index in 0..<courses.count {
                    if let namestr = courses[index].name {
                        print(namestr)
                    }
                    if let linkstr = courses[index].link{
                        print(linkstr)
                    }
                }
                
            }catch {
                print("error")
            }
            }.resume()
        
    }
    
    
    
}

