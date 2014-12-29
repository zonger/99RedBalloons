//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Ryan Liu on 2014-12-29.
//  Copyright (c) 2014 Ryan Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var balloonsLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var balloons:[Balloon] = [];
    
    var currentIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createBalloons();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonBarButtonItemPressed(sender: UIBarButtonItem) {
        let balloon = balloons[currentIndex];
        
        balloonsLabel.text = "\(balloon.numberOfBalloons) balloon";
        backgroundImageView.image = balloon.image;
        
        currentIndex += 1;
    }
    
    func createBalloons () {
        for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
            var balloon = Balloon();
            balloon.numberOfBalloons = balloonCount;
            
            let randomNumber = Int(arc4random_uniform(UInt32(4)));
            
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg");
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg");
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg");
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg");
            }
            
            self.balloons.append(balloon);
        }
    }

}

