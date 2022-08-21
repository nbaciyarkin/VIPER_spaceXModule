//
//  AnimatedButton.swift
//  VIPER
//
//  Created by Hamdi Aktar on 15.06.2022.
//

import UIKit

class AnimatedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        backgroundColor = UIColor.green.withAlphaComponent(0.7)
    }
    
    func touchIn(){
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = .init(scaleX: 0.9, y: 0.9)
        }, completion:  nil)
    }
    
    func touchEnd(){
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = .identity
        }, completion:  nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchIn()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        touchEnd()
    }

}
