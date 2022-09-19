/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Controller responsável pela tela de alimentos
class FoodController: UIViewController {
    
    /* MARK: - Atributos */


    /// View principal que a classe vai controlar
    private let myView = FoodView()
    
    /* Delegate & Data Sources */
    /// Instancia da classe Data Source
    let foodCollectionDataSource = FoodCollectionDataSource()
    
    /// Instancia da classe Delegate
    let foodCollectionDelegate = FoodCollectionDelegate()

		
    
    /* MARK: - Ciclo de Vida */
    
    
    override func loadView() {
        self.view = self.myView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupDelegates()
        self.setupButtonsAction()
    }
    


    /* MARK: - Protocolo */

	

    /* MARK: - Ações de botões */
    
    
    
    /* MARK: - Configurações */
    
    
    /// Definindo as ações dos botões
    private func setupButtonsAction() {
	  
    }
    
    
    /// Definindo os delegates, data sources e protocolos
    private func setupDelegates() {
        self.myView.setDataSource(with: self.foodCollectionDataSource)
    }
}
