
import UIKit
import AppCenterAnalytics

class AnalyticsViewController: UIViewController {

    @IBOutlet weak var customEventButton: UIButton!
    @IBOutlet weak var customColorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customColorButton.layer.cornerRadius = 10.0
        customEventButton.layer.cornerRadius = 10.0

        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
    }

    @IBAction func analyticsButtonTapped(_ sender: UIButton) {
        switch sender {
        case customEventButton:
            print("send a custom alert via Cocoapods")
            presentCustomEventAlert()

        case customColorButton:
            print("custom color property button pressed")
            presentColorPropertyAlert()

        default:
            break
        }
    }

    // - MARK: Alert Functions

    func presentCustomEventAlert() {
        let alert = UIAlertController(title: "Event sent",
                                      message: "",
                                      preferredStyle: .alert)

        // OK Button
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: {
            MSAnalytics.trackEvent("Sample event sent")
        })
    }

    func presentColorPropertyAlert() {
        let alert = UIAlertController(title: "Choose a color",
                                      message: "",
                                      preferredStyle: .alert)
        alert.view.tintColor = UIColor.black

        // Yellow button
        let yellowTitle = "💛 Yellow"
        alert.addAction(UIAlertAction(title: yellowTitle,
                                      style: .default,
                                      handler: { _ in
                                        self.trackEvent(yellowTitle)
                                        alert.dismiss(animated: true, completion: nil)
        }))

        // Blue button
        let blueTitle = "💙 Blue"
        alert.addAction(UIAlertAction(title: blueTitle,
                                      style: .default,
                                      handler: { _ in
                                        self.trackEvent(blueTitle)
                                        alert.dismiss(animated: true, completion: nil)
        }))

        // Red button
        let redTitle = "❤️ Red"
        alert.addAction(UIAlertAction(title: redTitle,
                                      style: .default,
                                      handler: { _ in
                                        self.trackEvent(redTitle)
                                        alert.dismiss(animated: true, completion: nil)
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func trackEvent(_ color: String) {
        MSAnalytics.trackEvent("Color selected", withProperties: ["color" : color])
    }
    
}
