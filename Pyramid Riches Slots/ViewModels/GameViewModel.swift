
import SwiftUI

extension GameView {
    final class ViewModel: ObservableObject {
        @Published var winAmount = 0
        @Published var betAmount = 0
        
        @Published var tiles = [String]()
        @Published var combinationsTilesIndices = [Int]()
        
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
            var sequences = [[Int]]()
            
            // Поиск по горизонтали
            for row in 0..<rows {
                var count = 1
                for col in 1..<cols {
                    let index = row * cols + col
                    let prevIndex = index - 1
                    if tiles[index] == tiles[prevIndex] {
                        count += 1
                        if count >= 3 && (col == cols - 1 || tiles[index] != tiles[index + 1]) {
                            let sequence = Array((index - count + 1)...index)
                            sequences.append(sequence)
                        }
                    } else {
                        count = 1
                    }
                }
            }

            // Поиск по вертикали
            for col in 0..<cols {
                var count = 1
                for row in 1..<rows {
                    let index = row * cols + col
                    let prevIndex = index - cols
                    if tiles[index] == tiles[prevIndex] {
                        count += 1
                        if count >= 3 && (row == rows - 1 || tiles[index] != tiles[index + cols]) {
                            let sequence = stride(from: index, through: index - (count - 1) * cols, by: -cols).map { $0 }
                            sequences.append(sequence)
                        }
                    } else {
                        count = 1
                    }
                }
            }
            
            sequences.forEach {
                winAmount += $0.count * betAmount
            }
            
            combinationsTilesIndices = sequences.flatMap { $0 }
        }
    }
}
