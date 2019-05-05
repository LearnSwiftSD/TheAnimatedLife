import UIKit

public class LogoImageView: UIImageView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLogoImage()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLogoImage()
    }
    
}

extension LogoImageView {
    
    private func setupLogoImage() {
        image = UIImage(imageLiteralResourceName: "OriginalLogo")
        contentMode = .scaleAspectFit
        clipsToBounds = true
    }
    
}
