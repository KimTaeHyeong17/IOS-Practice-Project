//
//  Weather.swift
//  JsonFromWeb
//
//  Created by 김태형 on 29/05/2019.
//  Copyright © 2019 김태형. All rights reserved.
//

import Foundation

struct Weather {
    let summary:String
    let icon:String
    let temperature:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String,Any)
    }
    
    init(json:[String:Any]) throws {
        guard let summary = json["summery"] as? String else{throw SerializationError.missing("summary is missing")}
        
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("icon is missing")}
        
        guard let temperature = json["temperatureMax"] as? Double else{throw SerializationError.missing("temp is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    
    static let basePath = "https://api.darksky.net/forecast/aaa13b28ecaf6e4b8a43c7295e61ec97/"
    
    static func forecast (withLocation location:String, completion: @escaping ([Weather]) -> ()){
        print("forecastcalled")
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request){(data:Data?, response:URLResponse?,error:Error?) in
            var forcastArray:[Weather] = []
            
            if let data = data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                        if let dailyForecasts = json["daily"] as? [String:Any]{
                            if let dailyData = dailyForecasts["data"] as? [[String:Any]]{
                                for dataPoint in dailyData{
                                    if let weatherObject = try? Weather(json: dataPoint){
                                        forcastArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
                completion(forcastArray)
            }
        }
        task.resume()
        
        
        
    }
}
