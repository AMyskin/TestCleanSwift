//
//  HomeViewController.swift
//  TestCleanSwift
//
//  Created by Alexander Myskin on 29.12.2020.
//

import UIKit

// ViewController
/// Протокол логики для отображения подготовленной информации
protocol HomeDisplayLogic: class {
    
    /// Метод логики отображения данных
    func displayUser(_ viewModel: HomeModels.FetchUser.ViewModel)
}

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    
    @IBAction func routerButtonPush(_ sender: UIButton) {
        router?.routeToRedScene()
    }
    
    /// Ссылка на протокол бизнес логики Interactor'a сцены
    var interactor: HomeBusinessLogic?
    var router: SceneRoutingLogic?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Метод для стартовой настройки компонентов сцены
    private func setup() {
        // Создаем компоненты VIP цикла
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = MainRouter()
        
        // Связываем созданные компоненты
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        
        
        // Указываем ссылку на Interactor для View Controller
        self.interactor = interactor
        // Указываем ссылку на Router для View Controller
        self.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Запускаем метод подгрузки данных при показе сцены
        loadUserInfromation()
    }
    
    /// Делаем запрос к Interactor для получения данных
    private func loadUserInfromation() {
        // Создаем экземпляр запроса к Interactor с параметрами
        let request = HomeModels.FetchUser.Request(userName: "Aleksey")
        
        // Вызываем метод бизнес логики у Interactor'a
        interactor?.fetchUser(request)
    }
}

/// Подписываем контроллер под протокол HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    
    func displayUser(_ viewModel: HomeModels.FetchUser.ViewModel) {
        userEmail.text = viewModel.userEmail
        userPhone.text = viewModel.userPhone
    }
}

