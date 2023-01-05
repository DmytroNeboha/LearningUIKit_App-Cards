import UIKit




class BoardGameController: UIViewController {
    // кнопка для запуска/перезапуска игры
    lazy var startButtonView = getStartButtonView()
    // количество уникальных карточек
    var cardsPairsCount = 8
    // сущность "Игра"
    lazy var game: Game = getNewGame()
    // игровое поле
    lazy var boardGameView = getBoardGameView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(startButtonView)
        view.addSubview(boardGameView)
    }
    
    private func getStartButtonView() -> UIButton {
        // 1 создаём кнопку
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        // 2 изменяем положение кнопки
        button.center.x = view.center.x
        // получаем доступ к текущему окну
        let window = UIApplication.shared.windows[0]
        // определяем отступ сверху от границ окна до  Safe Area
        let topPadding = window.safeAreaInsets.top
        button.frame.origin.y = topPadding
        
        // 3 настраиваем внешний вид кнопки:
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 10
        
        // подключаем обработчик нажатия на кнопку
        button.addTarget(nil, action: #selector(startGame(_:)), for: .touchUpInside)
        
        return button
        
    }
    
    @objc func startGame(_ sender: UIButton) {
        print("button was pressed")
    }
    
    // Размещение игрового поля
    private func getBoardGameView() -> UIView {
        // оступ игрового поля от ближайших элементов
        let margin: CGFloat = 10
        
        let boardView = UIView()
        // указываем координаты Х
        boardView.frame.origin.x = margin
        // указываем координаты Y
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        boardView.frame.origin.y = topPadding + startButtonView.frame.height + margin
        
        // рассчитывем ширину
        boardView.frame.size.width = UIScreen.main.bounds.width - margin*2
        // рассчитываем высоту с учетом нижнего отступа
        let bottomPadding = window.safeAreaInsets.bottom
        boardView.frame.size.height = UIScreen.main.bounds.height - boardView.frame.origin.y - margin - bottomPadding
        
        // изменяем стиль игрового поля
        boardView.layer.cornerRadius = 5
        boardView.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1, alpha: 0.3)
        
        return boardView
    }
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCount
        game.generateCards()
        return game
    }

}
