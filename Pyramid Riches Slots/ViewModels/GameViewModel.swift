
import SwiftUI

extension GameView {
    final class ViewModel: ObservableObject {
        @Published var winAmount = 0
        @Published var betAmount = 0
        
        @Published var tiles = [String]()
        
        private let rows = 3
        private let cols = 5
        private let availableTiles = (1...9).map { "tile\($0)" }
        
        var enumeratedTiles: [(offset: Int, element: String)] {
            Array(tiles.enumerated())
        }
        
        func fillBoard() {
            tiles = Array(repeating: "", count: rows * cols)
            
            for i in 0..<rows*cols {
                if let randomTile = availableTiles.randomElement() {
                    tiles[i] = randomTile
                }
            }
        }
    }
}
