//
//  FavoriteLaunchesWorker.swift
//  VIPER
//
//  Created by Hamdi Aktar on 14.06.2022.
//

import Foundation
import UIKit
import CoreData

class DatapersistenceManager {
    
    enum DatabaseError : Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DatapersistenceManager()
    
    func saveRocket(model: LaunchModel, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let item = RocketDataModel(context: context)
        
        item.name = model.name
        item.detail = model.details
        item.date = model.date_local
        item.image_link = model.links?.patch?.small
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
            print(error.localizedDescription)
        }
    }
    
    func fetchingTitleItemFromDatabase(completion: @escaping(Result<[RocketDataModel], Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest <RocketDataModel>
        
        request = RocketDataModel.fetchRequest()
        
        do{
            let titles = try context.fetch(request)
            completion(.success(titles))
            print(titles)
            
        } catch {
            completion(.failure(DatabaseError.failedToFetchData))
        }
    }
    
    func deleteTitleWith(model: RocketDataModel, completion: @escaping(Result<Void, Error>) -> Void ) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model) // asking the database manager to delete ceretain object
        
        do{
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToDeleteData))
        }
    }
}
