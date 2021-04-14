import Foundation
import UIKit

class VisualEffect: UIView
{
    init()
    {
        super.init(frame: CGRect.zero)
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        alpha = 0.3
    }
    
    func configurateVisualEffect(view: inout UIView)
    {
        view.addSubview(self)
        
        self.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
