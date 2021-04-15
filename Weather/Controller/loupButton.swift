import UIKit

class loupButton: UIButton {

    override func draw(_ rect: CGRect)
    {
        layer.add(animationGroup, forKey: nil)
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
            anim.toValue = 1.2
            
            
            return anim
        }()
}
