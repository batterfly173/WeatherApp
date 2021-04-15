import UIKit

class loupButton: UIButton {

    override func draw(_ rect: CGRect)
    {
        layer.add(animationGroup, forKey: nil)
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = #colorLiteral(red: 0.8031210914, green: 0.9659870222, blue: 1, alpha: 1)
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
    }
    
    private var animationGroup: CAAnimationGroup =
        {
            var group = CAAnimationGroup()
            group.animations = [animation]
            group.duration = 1
            group.repeatCount = .infinity
            
            return group
        }()
    
    private static var animation: CABasicAnimation =
        {
            let anim = CABasicAnimation(keyPath: "transform.scale")
            anim.fromValue = 1
            anim.toValue = 1.1
            
            
            return anim
        }()
}
