//
//  IntroViewController.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 3.03.2024.
//

import UIKit

class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let timer = Timer
            .scheduledTimer(timeInterval: 1.5,
                            target: self,
                            selector: #selector(timeToMoveOn),
                            userInfo: nil,
                            repeats: false)
        
        assignbackground()
        
    }
    
    
    @objc func timeToMoveOn(){
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toComposersVC") as! ComposersViewController
        self.navigationController?.setViewControllers([ComposersViewController()], animated: true)
    }
    
    func assignbackground(){
        let background = UIImage(named: "intropic")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
}


