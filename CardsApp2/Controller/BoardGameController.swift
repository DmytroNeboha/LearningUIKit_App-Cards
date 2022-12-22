import UIKit




class BoardGameController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // количество уникальных карточек
    var cardsPairsCount = 8
    // сущность "Игра"
    lazy var game: Game = getNewGame()
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCount
        game.generateCards()
        return game
    }

}
