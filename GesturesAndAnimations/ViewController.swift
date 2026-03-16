//
//  ViewController.swift
//  GesturesAndAnimations
//
//  Created by Mikael Engvall on 2026-03-16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var gestureNameLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
        
    }

    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        
        //print("Moving")
        
        guard let viewToPan = sender.view else {return}
        
        let translation = sender.translation(in: self.view)
        
        
        viewToPan.center = CGPoint(x: viewToPan.center.x + translation.x,
                                   y: viewToPan.center.y + translation.y)

        sender.setTranslation(CGPoint.zero, in: self.view)
        
        
    }
    
    
    @IBAction func handleSingleTap(_ sender: UITapGestureRecognizer) {
        
        showGesture(name: "tap")
        
        
    }
    
    
    @IBAction func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        showGesture(name: "double tap")
        
        
    }
    
    @IBAction func cityTaped(_ sender: UITapGestureRecognizer) {
        
        
        
        print ("City tapped!")
    }
    
    func showGesture (name:String){
        gestureNameLabel.text = name
        
        UIView.animate(withDuration: 1, animations: {self.gestureNameLabel.alpha = 1.0},completion:
                        fadeOutLabel(finished:))
        
        
    }
    
    func fadeOutLabel(finished: Bool) {
        UIView.animate(withDuration: 1, animations: {self.gestureNameLabel.alpha = 0.0})
    }
}

