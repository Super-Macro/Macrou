/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável pela tela de favoritos
class FavoriteViewController: MenuController, GardenProtocol, FoodProtocol {
    
    /* MARK: - Atributos */
    
    /* View */

    /// View principal que a classe vai controlar
    private let myView = FavoriteView()
    
    
    /* Delegate & Data Sources */
    
    /// Data source da collection de alimentos
    private let foodDataSource = FoodCollectionDataSource()
    
    /// Delegate da collection de alimentos
    private let foodDelegate = FoodCollectionDelegate()
    
    /// Data source da collection das hortas
    private let gardenDataSource = GardenDataSource()
    
    /// Delegate da collection das hortas
    private let gardenDelegate = GardenDelegate()


        
    /* MARK: - Ciclo de Vida */
    
    override func loadView() {
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupDelegates()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupDataSourcesData()
        self.myView.reloadCollectionsData()
    }
    


    /* MARK: - Protocolo */
    
    internal func openGardenInfo(for index: Int) {
        let selectedCell = self.gardenDataSource.data[index]
        
        let controller = InfoGardenController(with: selectedCell, in: index)
        
        self.tabBarProtocol?.showTabBar(is: false)
        self.present(controller, animated: true)
    }
    
        
    internal func openFoodInfo(for index: Int) {
        let selectedCell = self.foodDataSource.data[index]
        
        let controller = InfoFoodController(with: selectedCell, in: index)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        
        self.tabBarProtocol?.showTabBar(is: false)
        self.present(controller, animated: true)
    }
    
    
    /* MARK: - Configurações */

    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
        self.gardenDelegate.setProtocol(with: self)
        self.foodDelegate.setProtocol(with: self)
        
        self.myView.setFoodDataSource(with: self.foodDataSource)
        self.myView.setFoodDelegate(with: self.foodDelegate)
        
        self.myView.setGardenDataSource(with: self.gardenDataSource)
        self.myView.setGardenDelegate(with: self.gardenDelegate)
    }
    
    
    private func setupDataSourcesData() {
        // Alimentos
        let foodFavorite = DataManager.shared.getFavoriteItens(for: .food)
        if let foodFav = foodFavorite as? [ManagedFood] {
            self.foodDataSource.data = foodFav
        }
        
        
        // Hortas
        let gardenFavorite = DataManager.shared.getFavoriteItens(for: .garden)
        if let gardenFav = gardenFavorite as? [ManagedGarden] {
            self.gardenDataSource.data = gardenFav
        }
    }
}
