// These are answers I've found on Stack Overflow or solutions I've created myself
// I hope they can help you too

import Foundation
import AVFoundation
import CoreData

// 1) Create a background with a gradient for your view
// if you're using Storyboards, create a background color
// so you can see your other items in your view if your text is white
// on a blue background, for example. Below example is a light blue

// Put this in viewDidLoad
let gradient: CAGradientLayer = CAGradientLayer()
let arrayColors: [AnyObject] = [
    UIColor(red: 0.302, green: 0.612, blue: 0.961, alpha: 1.000).CGColor,
    UIColor(red: 0.247, green: 0.737, blue: 0.984, alpha: 1.000).CGColor
]

gradient.frame = view.bounds
gradient.colors = arrayColors
view.layer.insertSublayer(gradient, atIndex: 0)



// 2) Play a sound with AVFoundation

// add AVAudioPlayerDelegate to your ViewController like this:
// class ViewController: UIViewController, AVAudioPlayerDelegate { ... }

// declare the player and the error optionals
var avPlayer: AVAudioPlayer?
var error: NSError?

// first line creates a url, which you feed into the player and then play
// use self. with these because your declaration of avPlayer above attached the player 
// to the ViewController which is the top-level object & has property ViewContrller.avPlayer
let fileURL: NSURL! = NSBundle.mainBundle().URLForResource("sound_name", withExtension: "wav")
self.avPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
self.avPlayer?.play()