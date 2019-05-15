import UIKit

open class TransitionViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()
    let enterButton = UIButton()
    let exitButton = UIButton()
    
    lazy public var transitionView = TransitionView.create(
        primary: firstView,
        secondary: secondView,
        transitionStyle: .transitionCrossDissolve
    )
    
    override open func loadView() {
        firstView.backgroundColor = UIColor.black
        secondView.backgroundColor = UIColor.black
        view = transitionView
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    @objc
    func tappedTransition() {
        transitionView.transition()
    }
    
}

extension TransitionViewController {
    
    private func setupViewController() {
        setupEntryView()
        setupMapView()
        setupEnterButton()
        setupExitButton()
    }
    
    private func setupEntryView() {
        let image = UIImage(imageLiteralResourceName: "TravelerEntry")
        let imageView = UIImageView(image: image)
        firstView.addSubview(imageView)
        imageView.snapTo(firstView)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupMapView() {
        let image = UIImage(imageLiteralResourceName: "TravelerMap")
        let imageView = UIImageView(image: image)
        secondView.addSubview(imageView)
        imageView.snapTo(secondView)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupEnterButton() {
        enterButton.addTarget(self, action: #selector(tappedTransition), for: .touchUpInside)
        firstView.addSubview(enterButton)
        enterButton.useAutoLayout(
            enterButton.widthAnchor.constraint(equalToConstant: 318),
            enterButton.heightAnchor.constraint(equalToConstant: 91),
            enterButton.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
            enterButton.centerYAnchor.constraint(equalTo: firstView.centerYAnchor, constant: 160)
        )
        let image = UIImage(imageLiteralResourceName: "EnterButton")
        enterButton.setImage(image, for: .normal)
    }
    
    private func setupExitButton() {
        exitButton.addTarget(self, action: #selector(tappedTransition), for: .touchUpInside)
        secondView.addSubview(exitButton)
        exitButton.useAutoLayout(
            exitButton.widthAnchor.constraint(equalToConstant: 100),
            exitButton.heightAnchor.constraint(equalToConstant: 44),
            exitButton.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 20),
            exitButton.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 30)
        )
        let image = UIImage(imageLiteralResourceName: "ExitButton")
        exitButton.setImage(image, for: .normal)
    }
    
}
