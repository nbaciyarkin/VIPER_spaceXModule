//
//  LaunchesViewModel.swift
//  VIPER
//
//  Created by Hamdi Aktar on 9.06.2022.
//

import Foundation

// MARK: - TABLEVİEW PRESENTABLE DATA
struct LaunchesViewModel {
    let launchName:String
    let image_link: String
    let date_local: String
}

//MARK: - PRESENTABLE DETAİL PAGE MODEL
struct LaunchDetailViewModel {
    let title: String
    let launchDetail: String
    let articleLink: String
    let launch_image: String
}


//MARK: - LAUNCH MODEL RESPONSE
struct LaunchesModelResponse: Codable {
    let launchResults: [LaunchModel]
}

struct LaunchModel: Codable {
    let name: String?
    let date_local: String?
    let flight_number: Int?
    let details: String?
    let links: LinkModel?
}

struct LinkModel: Codable {
    let patch: PatchModel?
    let youtube_id: String?
    let article: String?
}

struct PatchModel: Codable {
    let small: String?
    let large: String?
}
