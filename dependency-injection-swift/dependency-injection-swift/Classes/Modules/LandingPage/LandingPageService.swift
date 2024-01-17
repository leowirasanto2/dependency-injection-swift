//
//  LandingPageService.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation

class LandingPageService: ILandingPageService {
    let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchHeadlineNews(countryCode: String, _ result: @escaping (Result<NewsResponse, CustomError>) -> Void) {
        let request = APIRequest(
            endPoint: "/v2/top-headlines",
            parameters: [
                "country": "us",//countryCode,
                "apiKey": "283968034fbc4db691fd4115a1e2daec",
                "pageSize": "10"
            ],
            keyCodingStrategy: .useDefaultKeys
        )
        apiService.fetch(request, result: result)
    }
}
