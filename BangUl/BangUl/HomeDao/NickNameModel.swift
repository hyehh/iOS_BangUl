//
//  NickNameModel.swift
//  BangUl
//
//  Created by Hyeji on 2021/09/12.
//

import Foundation

// 일반회원의 닉네임 정보 불러오는 Dao
protocol NickNameModelProtocol : AnyObject {
    func itemDownloaded(items: NSMutableArray)
}

class NickNameModel : NSObject {
    var delegate: NickNameModelProtocol!
    var urlPath = "http://\(macIp):8080/bangul/jsp/"
    
    func downloadItems() {
        let urlAdd = "getNickName.jsp?gId=\(loginId)"
        urlPath = urlPath + urlAdd
        print(urlPath)
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data){
        var jsonResult = NSArray()
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        print(jsonResult.count)
        
        for i in 0..<jsonResult.count {
            jsonElement = jsonResult[i] as! NSDictionary
            if let gNickName = jsonElement["gNickName"] as? String{
                
                let query = GeneralUserModel(gNickName: gNickName)
                locations.add(query)
                
            }
        }

        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
    })
    }
}
