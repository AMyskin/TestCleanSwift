//
//  Models.swift
//  TestCleanSwift
//
//  Created by Alexander Myskin on 29.12.2020.
//

import Foundation

// Models
/// Модель для передачи данных в VIP цикле
enum HomeModels {
/// Набор запросов для одного VIP цикла
  enum FetchUser {
/// Запрос к Interactor из View Controller
    struct Request {
let userName: String
    }
/// Запрос к Presentor из Interactor
    struct Response {
let userPhone: String
let userEmail: String
    }
/// Запрос к View Controller из Presentor
    struct ViewModel {
let userPhone: String
let userEmail: String
    }
  }
}
