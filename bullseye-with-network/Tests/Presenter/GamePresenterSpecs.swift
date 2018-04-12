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
        it("calls the Game's hit method with proper value") {
          let gameMock = GameMock()
          let viewMock = GameViewControllerMock()
          let presenter = GamePresenter(view: viewMock, game: gameMock)

          presenter.hit(value: 16)

          expect(gameMock.didCallHit).to(beTrue())
          expect(gameMock.didCallHitWithValue).to(equal(16))
        }
        
        it("updates Game's round after hit") {
          let gameMock = GameMock()
          let viewMock = GameViewControllerMock()
          let presenter = GamePresenter(view: viewMock, game: gameMock)
          let newRound = gameMock.round + 1
          
          presenter.hit(value: 16)
          
          expect(gameMock.didCallHit).to(beTrue())
          expect(gameMock.round).to(equal(newRound))
        }
        
        it("calls the View to update the score") {
          let gameMock = GameMock()
          let viewMock = GameViewControllerMock()
          let presenter = GamePresenter(view: viewMock, game: gameMock)
          gameMock.score = 666
          
          presenter.hit(value: 16)

          expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
          expect(viewMock.didCallUpdateScoreLabelWithValue).to(equal(666))
        }
        
        it("call the View to update the round after hit") {
          let gameMock = GameMock()
          let viewMock = GameViewControllerMock()
          let presenter = GamePresenter(view: viewMock, game: gameMock)
          gameMock.round = 1
          
          presenter.hit(value: 16)
          
          expect(viewMock.didCallUpdateRoundLabel).to(beTrue())
          expect(viewMock.didCallUpdateRoundLabelWithValue).to(equal(2))
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
  
  func newRound() {
    
  }
  
  func hit(value: Int) -> Perfection {
    didCallHit = true
    didCallHitWithValue = value
    round += round
    
    return .almost
  }
  
  func resetGame() {
    
  }
  
  
}
