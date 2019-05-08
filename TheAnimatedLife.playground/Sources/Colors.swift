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
    
    static var gradientGray: (light: UIColor, dark: UIColor) {
        return (
            UIColor(
                red: hex(62),
                green: hex(72),
                blue: hex(90),
                alpha: 1
            ),
            UIColor(
                red: hex(20),
                green: hex(26),
                blue: hex(40),
                alpha: 1
            )
        )
    }
    
    static var gradientOrange: (light: UIColor, dark: UIColor) {
        return (
            UIColor(
                red: hex(255),
                green: hex(191),
                blue: hex(25),
                alpha: 1
            ),
            UIColor(
                red: hex(255),
                green: hex(115),
                blue: hex(41),
                alpha: 1
            )
        )
    }
    
}
