import Foundation
import Alamofire
import SwiftyJSON
import ArgumentParser
import Darwin

struct CommandLineTool : ParsableCommand{
    
    //read arg
    @Argument()
    var username: String
    
    func run() throws {
        DispatchQueue.main.async {
            getRepos(username: self.username)
        }
        dispatchMain()
    }
}


//func to request git using alamofire
func getRepos(username: String){

    //link to JSON with repos
    let URL = "https://api.github.com/users/"+username+"/repos"
    
    //request with .get method
    Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON {response in
            switch response.result{
                
                case .success(let value):
                    guard (value as Any?) != nil else {return}
                    let json = JSON(value)
                    let arrayNames =  json[].arrayValue.map {$0["name"].stringValue}
                    if arrayNames.count !=  0 {
                        arrayNames.forEach(){print($0)}
                    }else{
                     print("User has no repositories!")
                    }
                    exit(EXIT_SUCCESS)
                
                case .failure(let error):
                    print(error)
                    exit(EXIT_FAILURE)
            }
    }
}

CommandLineTool.main()
