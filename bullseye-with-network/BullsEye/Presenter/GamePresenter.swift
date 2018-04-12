class GamePresenter {
  let view: GameViewController
  let game: Game
  
  init(view: GameViewController, game: Game = BullsEye()) {
    self.view = view
    self.game = game
    self.view.presenter = self
  }
  
  func hit(value: Int) {
    _ = game.hit(value: value)
    
    game.newRound()
    view.updateScoreLabel(value: game.score)
    view.updateRoundLabel(value: game.round)
  }
  
  func resetGame() {
    game.resetGame()
    
    view.updateScoreLabel(value: game.score)
    view.updateRoundLabel(value: game.round)
  }
}
