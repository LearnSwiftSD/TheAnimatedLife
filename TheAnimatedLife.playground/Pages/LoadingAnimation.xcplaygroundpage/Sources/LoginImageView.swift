import UIKit

public class LoginImageView: UIImageView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoginImage()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLoginImage()
    }
    
}

extension LoginImageView {
    
    private func setupLoginImage() {
        image = UIImage(imageLiteralResourceName: "MockLogin")
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
    
}

