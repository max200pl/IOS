import UIKit

extension UIButton {
    func makeCircular() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
button.backgroundColor = .blue
button.makeCircular()


//extension Double {
//    func round(to places: Int) -> Double {
//        let precision = pow(10, Double(places))
//        var n = self
//        n = n * precision
//        n.round()
//        n = n / precision
//        return n
//    }
//}
//
//var myDouble: Double = 37.5312332
//
//myDouble.round(to: 1)
