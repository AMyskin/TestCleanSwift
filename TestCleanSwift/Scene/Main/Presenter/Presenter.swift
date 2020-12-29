//
//  Presenter.swift
//  TestCleanSwift
//
//  Created by Alexander Myskin on 29.12.2020.
//

import Foundation

/// Протокол логики презентации
protocol HomePresentationLogic: class {

  /// Метод форматирования полученных данных с Interactor'a
  func presentUser(_ response: HomeModels.FetchUser.Response)
}

final class HomePresenter: HomePresentationLogic {

  /// Ссылка на логику отображения View Controller'a
  weak var viewController: HomeDisplayLogic?

  func presentUser(_ response: HomeModels.FetchUser.Response) {
    // Подготовка данных для отображения
    // Для примера отформатируем номер телефона
    let formattedPhone = response.userPhone.replacingOccurrences(of: "-", with: " ")

    // Создаем экземляр ViewModel для отправки в View Controller
    let viewModel = HomeModels.FetchUser.ViewModel(userPhone: formattedPhone, userEmail: response.userEmail)

    // Вызываем метод логики отображения у View Controller'a
    viewController?.displayUser(viewModel)
  }
}
