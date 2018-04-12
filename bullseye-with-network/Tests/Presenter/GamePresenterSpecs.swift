import Quick
import Nimble

@testable import BullsEye

class GamePresenterSpecs: QuickSpec {
  override func spec() {
    describe("GamePresenter") {
      describe("init") {
        it("starts with a GameViewController") {
          let view = GameViewController()
          
          let presenter = GamePresenter(view: view)
          
          expect(presenter.view).to(equal(view))
        }
        
        it("starts with a Game instance") {
          let presenter = GamePresenter(view: GameViewController())
          
          expect(presenter.game).to(beAKindOf(Game.self))
        }
      }
      
      describe("hit") {
        var gameMock: GameMock!
        var viewMock: GameViewControllerMock!
        var presenter: GamePresenter!
        
        beforeEach {
          gameMock = GameMock()
          viewMock = GameViewControllerMock()
          presenter = GamePresenter(view: viewMock, game: gameMock)
        }
        
        it("calls the Game's hit method with proper value") {
          presenter.hit(value: 16)

          expect(gameMock.didCallHit).to(beTrue())
          expect(gameMock.didCallHitWithValue).to(equal(16))
        }
        
        it("calls the View to update the score") {
          gameMock.score = 666
          
          presenter.hit(value: 16)

          expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
          expect(viewMock.didCallUpdateScoreLabelWithValue).to(equal(666))
        }
      }
      
      describe("newRound") {
        var gameMock: GameMock!
        var viewMock: GameViewControllerMock!
        var presenter: GamePresenter!
        
        beforeEach {
          gameMock = GameMock()
          viewMock = GameViewControllerMock()
          presenter = GamePresenter(view: viewMock, game: gameMock)
        }
        
        it("updates Game's round after hit") {
          let newRound = gameMock.round + 1
          
          presenter.hit(value: 16)
          
          expect(gameMock.didCallNewRound).to(beTrue())
          expect(gameMock.round).to(equal(newRound))
        }
        
        it("call the View to update the round after hit") {
          gameMock.round = 1
          
          presenter.hit(value: 16)
          
          expect(viewMock.didCallUpdateRoundLabel).to(beTrue())
          expect(viewMock.didCallUpdateRoundLabelWithValue).to(equal(2))
        }
      }
      
      describe("resetGame") {
        var gameMock: GameMock!
        var viewMock: GameViewControllerMock!
        var presenter: GamePresenter!
        
        beforeEach {
          gameMock = GameMock()
          viewMock = GameViewControllerMock()
          presenter = GamePresenter(view: viewMock, game: gameMock)
        }
        
        it("resets Game's round and score") {
          presenter.hit(value: 16)
          presenter.hit(value: 16)
          
          presenter.resetGame()
          
          expect(gameMock.didCallResetGame).to(beTrue())
          expect(gameMock.round).to(equal(1))
          expect(gameMock.score).to(equal(0))
        }
        
        it("call the View to resets round and score") {
          presenter.hit(value: 16)
          presenter.hit(value: 16)
          
          presenter.resetGame()
          
          expect(viewMock.didCallUpdateRoundLabel).to(beTrue())
          expect(viewMock.didCallUpdateRoundLabelWithValue).to(equal(1))
          expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
          expect(viewMock.didCallUpdateScoreLabelWithValue).to(equal(0))
        }
      }
    }
  }
}

class GameViewControllerMock: GameViewController {
  var didCallUpdateScoreLabel = false
  var didCallUpdateScoreLabelWithValue: Int?
  var didCallUpdateRoundLabel = false
  var didCallUpdateRoundLabelWithValue: Int?
  
  override func updateScoreLabel(value: Int) {
    didCallUpdateScoreLabel = true
    didCallUpdateScoreLabelWithValue = value
  }
  
  override func updateRoundLabel(value: Int) {
    didCallUpdateRoundLabel = true
    didCallUpdateRoundLabelWithValue = value
  }
}

class GameMock: Game {
  var round: Int = 1
  var target: Int = 0
  var score: Int = 0
  
  var didCallHit = false
  var didCallHitWithValue: Int?
  var didCallNewRound = false
  var didCallResetGame = false
  
  func newRound() {
    didCallNewRound = true
  
    round += round
  }
  
  func hit(value: Int) -> Perfection {
    didCallHit = true
    didCallHitWithValue = value
    
    newRound()
    
    return .almost
  }
  
  func resetGame() {
    didCallResetGame = true
    
    round = 1
    score = 0
  }
  
  
}
