import UIKit

public class LoadingViewController: UIViewController {
    
    private let logoImageView = LogoImageView(frame: CGRect.zero)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.originalTeal
        setupLogo()
    }
    
}

extension LoadingViewController {
    
    private func setupLogo() {
        
        view.addSubview(logoImageView)
        
        logoImageView.useAutoLayout(
            logoImageView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor, constant: 0),
            logoImageView.centerYAnchor
                .constraint(equalTo: view.centerYAnchor, constant: 0),
            logoImageView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            logoImageView.heightAnchor
                .constraint(equalTo: logoImageView.widthAnchor)
        )
    }
    
}
