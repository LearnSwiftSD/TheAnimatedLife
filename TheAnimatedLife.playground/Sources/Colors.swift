import UIKit

fileprivate func hex(_ hexValue: Int) -> CGFloat {
    let errorMessage = """
    \(hexValue) does not fall within the \
    excepted range of 0 - 255.
    """
    precondition(hexValue >= 0 && hexValue <= 255, errorMessage)
    let hexFloat = CGFloat(hexValue)
    return hexFloat/255
}

public extension UIColor {
    
    static var originalTeal: UIColor {
        return UIColor(
            red: hex(62),
            green: hex(186),
            blue: hex(206),
            alpha: 1
        )
    }
    
}
