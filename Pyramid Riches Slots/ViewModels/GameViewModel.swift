
import SwiftUI

extension GameView {
    final class ViewModel: ObservableObject {
        @Published var winAmount = 0
        @Published var betAmount = 0
        
        @Published var tiles = [String]()
        
        private let rows = 3
        private let cols = 5
        private let storage = StorageService.shared
        private let availableTiles = (1...9).map { "tile\($0)" }
        
        var enumeratedTiles: [(offset: Int, element: String)] {
            Array(tiles.enumerated())
        }
        
        func refillBoard() {
            tiles = Array(repeating: "", count: rows * cols)
            
            for i in 0..<rows*cols {
                if let randomTile = availableTiles.randomElement() {
                    tiles[i] = randomTile
                }
            }
        }
        
        func spin() {
            winAmount = 0
            refillBoard()
            findMatches()
            storage.coinsAmount -= betAmount
        }
        
        func findMatches() {
            var horizontalSequencesCount = 0
            var verticalSequencesCount = 0
            var totalHorizontalTiles = 0
            var totalVerticalTiles = 0
            
            // Функция для подсчета последовательностей в одном направлении
            func countSequences(startIndex: Int, step: Int, lineLength: Int) -> (count: Int, totalTiles: Int) {
                var count = 0
                var totalTiles = 0
                var sequenceLength = 1
                
                for i in 0..<(lineLength - 1) {
                    let currentIndex = startIndex + i * step
                    let nextIndex = currentIndex + step
                    
                    if tiles[currentIndex] == tiles[nextIndex] && tiles[currentIndex] != "" {
                        sequenceLength += 1
                    } else {
                        if sequenceLength >= 3 {
                            count += 1
                            totalTiles += sequenceLength
                        }
                        sequenceLength = 1
                    }
                }
                
                // Проверка последней последовательности в строке/столбце
                if sequenceLength >= 3 {
                    count += 1
                    totalTiles += sequenceLength
                }
                
                return (count, totalTiles)
            }
            
            // Поиск горизонтальных последовательностей
            for row in 0..<rows {
                let (count, tiles) = countSequences(startIndex: row * cols, step: 1, lineLength: cols)
                horizontalSequencesCount += count
                totalHorizontalTiles += tiles
            }
            
            // Поиск вертикальных последовательностей
            for col in 0..<cols {
                let (count, tiles) = countSequences(startIndex: col, step: cols, lineLength: rows)
                verticalSequencesCount += count
                totalVerticalTiles += tiles
            }
            
            if horizontalSequencesCount > 0 {
                winAmount += (totalHorizontalTiles-1) * betAmount
            }
            
            if verticalSequencesCount > 0 {
                winAmount += (totalVerticalTiles-1) * betAmount
            }
        }
    }
}
