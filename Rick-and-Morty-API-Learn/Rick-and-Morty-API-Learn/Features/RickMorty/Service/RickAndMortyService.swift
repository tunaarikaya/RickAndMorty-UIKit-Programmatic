//
//  RickAndMortyService.swift
//  Rick-and-Morty-API-Learn
//
//  Created by Mehmet Tuna Arıkaya on 23.03.2025.
//

import Alamofire

enum RickAndMortyServiceEndpoint : String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    
    case PATH = "/character"
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
    
}

protocol IRickAndMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickAndMortyService : IRickAndMortyService {
    func fetchAllDatas(response:@escaping ([Result]?) -> Void) {
        AF.request(RickAndMortyServiceEndpoint.characterPath()).responseDecodable(of : PostModel.self){
            (model) in
            guard let data = model.value else{
                response(nil)
                return
                
            }
            response(data.results)
        }
         
    }
}
