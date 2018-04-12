import Quick
import Nimble

@testable import BullsEye

class GameViewControllerSpecs: QuickSpec {
  var viewController: GameViewController!
  
  override func spec() {
    describe("GameViewController") {
      describe("updateScoreLabel") {
        beforeEach {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          self.viewController = storyboard.instantiateViewController(withIdentifier: "viewController") as! GameViewController
          
          self.viewController.loadView()
        }
        
        it("updates score label text with 10") {
          self.viewController.updateScoreLabel(value: 10)
          
        expect(self.viewController.scoreLabel.text).to(equal("10"))
        }
      
        it("updates round label text with 5") {
          self.viewController.updateRoundLabel(value: 5)
          
          expect(self.viewController.roundLabel.text).to(equal("5"))
        }
      }
    }
  }
}
