/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit

class NAME_Delegate: NSObject, UICollectionViewDelegate {
    
    /* MARK: - Atributos */
    // private weak var protocol: ?
        

    
    /* MARK: - Encapsulamento */
    

        /// Define o protocolo (View Controller -> Delegate)
    public func setProtocol(with protocolo: FoodProtocol) -> Void {
        self.protocol = protocol
    }
    
    
    
    /* MARK: - Delegate */
    
    /// Ação de quando clica em uma célula
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let protocol = self.protocol else {return}
    }
}
