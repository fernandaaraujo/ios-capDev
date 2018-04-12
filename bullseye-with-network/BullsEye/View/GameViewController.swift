import UIKit

class GameViewController: UIViewController {
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  weak var presenter: GamePresenter?
  
  @IBAction func hitMeTapped() {
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    
  }
  
  @IBAction func startNewGame() {
    
  }
  
  func updateScoreLabel(value: Int) {
    scoreLabel.text = String(value)
  }
  
  func updateRoundLabel(value: Int) {
    roundLabel.text = String(value)
  }

  func updateTargetLabel(value: Int) {
    targetLabel.text = String(value)
  }
}
