//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    //MARK: Outlets
    @IBOutlet weak var imgLogo: UIImageView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgLogo.alpha = 1.0

    }
    
    // MARK: - Actions
    @IBAction func didPressFade(_ sender: Any) {
        if self.imgLogo.alpha == 1.0{
            UIImageView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.imgLogo.alpha = 0.0
            })
        }else{
            UIImageView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut, animations: {
                self.imgLogo.alpha = 1.0
        })
            
       }
    }
    
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer){
        guard let recognizerView = recognizer.view else {
            return
        }
        
        let translation = recognizer.translation(in: view)
        recognizerView.center.x += translation.x
        recognizerView.center.y += translation.y
        recognizer.setTranslation(.zero, in: view)
    }
}
