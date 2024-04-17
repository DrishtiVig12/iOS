

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet var gameOver: UILabel!
    @IBOutlet var newGame: UIButton!
    
    var isGameOver = false {
        didSet{
            if isGameOver == true {
                gameOver.alpha = 1
                newGame.alpha = 1
            }else{
                gameOver.alpha = 0
                newGame.alpha = 0
            }
        }
    }
    var listOfWords = [String]()
    let backupList = ["bug", "swift"]
    
    let incorrectMovesAllowed = 7;
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    var currentGame : Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view")
        initializeList()
        newRound();
    }
    

    func initializeList (){
        listOfWords = backupList.map{ $0 }
        print("list inited")
        print(listOfWords)
    }
    
    func gameFinished(){
        isGameOver = true
    }
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        isGameOver = false
        print(gameOver.alpha)
        print(newGame.alpha)
        totalWins = 0
        totalLosses = 0
        initializeList()
        newRound()
    }
    
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord,
            incorrectMovesRemaining: incorrectMovesAllowed,
            guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
            print("newroud")
        } else {
            gameFinished()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
      for button in letterButtons {
        button.isEnabled = enable
      }
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
          } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
          } else {
            updateUI()
          }
    }
    
    func updateUI(){
        var letters = [String]();
        
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        
        let _ = letters.joined(separator: " ")
        
        correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    @IBAction func letterButtonPressed(_ sender: UIButton) {
      sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
}

