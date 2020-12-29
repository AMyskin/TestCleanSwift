//
//  Interactor.swift
//  TestCleanSwift
//
//  Created by Alexander Myskin on 29.12.2020.
//

import Foundation

// Interactor
/// Протокол бизнес логики Interactor'a
protocol HomeBusinessLogic: class {
    
    /// Метод получения данных из сети или других источников
    func fetchUser(_ request: HomeModels.FetchUser.Request)
    
}

final class HomeInteractor: HomeBusinessLogic {
    
    /// Ссылка на логику презентора сцены
    var presenter: HomePresentationLogic?
    
    func fetchUser(_ request: HomeModels.FetchUser.Request) {
        // Здесь должен быть код получения данных
        
        let userPhone = "+7 (999) 111-22-33"
        let userEmail = "test@request.ru"
        // ...
        // Создаем запрос к Presentor'у с необходимыми данными
        let response = HomeModels.FetchUser.Response(userPhone: userPhone, userEmail: userEmail)
        
        // Вызываем метод логики презентации у Presentor'а
        presenter?.presentUser(response)
    }
    
  
}
