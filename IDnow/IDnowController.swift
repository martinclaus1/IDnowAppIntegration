import Foundation
import IDNowSDKCore

public class IDnowController: UIViewController {
    private lazy var text: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isScrollEnabled = true
        return text
    }()
    
    func startIdentificationProcess() {
        IDNowSDK.shared.start(token: "some token", preferredLanguage:"de", fromViewController: self, listener:{(result: IDNowSDK.IdentResult.type, statusCode: IDNowSDK.IdentResult.statusCode, message: String) in
            if result == .CANCELLED {
                self.text.text = message
            }
            if result == .ERROR {
                self.text.text = message
            } else if result == .FINISHED {
                self.text.text = message
            }
        })
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        startIdentificationProcess()
        addConstrains()
    }
}

private extension IDnowController {
    
    func addConstrains() {
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.widthAnchor.constraint(equalToConstant: 250),
            text.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func addComponents(){
        view.addSubview(text)
    }
}
