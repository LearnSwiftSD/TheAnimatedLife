import UIKit

open class LoginViewController: UIViewController {
    
    public let logoImageView = LogoImageView(frame: CGRect.zero)
    public let logoBackgroundView = UIView()
    
    open override func loadView() {
        view = LoginImageView(frame: CGRect(x: 0, y: 0, width: 768.0, height: 1024.0))
    }
    
    open override func viewDidLoad() {
        setupLogoViews()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        runLoadingAnimation(logo: logoImageView, background: logoBackgroundView)
    }
    
    open func runLoadingAnimation(logo: UIView, background: UIView) {
        //Implement in overriden subclass method
    }
    
}

extension LoginViewController {
    
    private func setupLogoViews() {
        view.addSubview(logoBackgroundView)
        logoBackgroundView.backgroundColor = UIColor.originalTeal
        logoBackgroundView.snapTo(view)
        
        logoBackgroundView.addSubview(logoImageView)
        logoImageView.useAutoLayout(
            logoImageView.centerXAnchor
                .constraint(equalTo: logoBackgroundView.centerXAnchor, constant: 0),
            logoImageView.centerYAnchor
                .constraint(equalTo: logoBackgroundView.centerYAnchor, constant: 0),
            logoImageView.widthAnchor
                .constraint(equalTo: logoBackgroundView.widthAnchor, multiplier: 0.75),
            logoImageView.heightAnchor
                .constraint(equalTo: logoImageView.widthAnchor)
        )
        
    }
    
}
