/* Macro - Grupo 05 */

/* Bibliotecas necessárias: */
import UIKit


/// Data source da collection de mostrar os alimentos
class FoodCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var data: [ManagedFood] = []
    
    
    /// Mostra quantas células vão ser mostradas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    
    /// Configura uma célula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cria uma variácel para mexer com uma célula que foi criada
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCell.identifier, for: indexPath) as? FoodCell else {
            return UICollectionViewCell()
        }
        
        let data = self.data[indexPath.row]
        cell.setupCell(for: data)
        
        return cell
    }
}
