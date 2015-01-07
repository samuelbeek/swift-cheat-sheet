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


// 3) How to edit the text of a UIButton
// maybe your button has title "start"
// Normal state is when it's not pressed, when it's just chillin'
buttonName.setTitle("stop", forState: .Normal)


// 4) Setting the value of a textField a few different ways
myTextField.text = "Foo"

// you can edit the value of %.0f for different percision in the decimal, this will return 2, rather than 2.0 or 2.0000
myTextField.text = String(format: "%.0f", (Double(120) / Double(60)))

// convert integer to string
myTextField.text = (5).stringValue


// 5) removing the keyboard
// the code below should be tied to an IBAction most likely
// tap somewhere on the screen, resign first responder

// myTextField.resignFirstResponder()


// 6) Focus on a text field
// this is good for submitting a form with a bad value that needs editing
myTextField.becomeFirstResponder()


// 7) Hides the status bar at the top of the screen
override func prefersStatusBarHidden() -> Bool { return true }


// 8) Get last value from CoreData

// fetch last user from coredata
// you must import CoreData at the top of your file to do this
// this assumes your CoreData model has the entity "User", User here can be anything
let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
let managedObjectContext = appDelegate.managedObjectContext!
let request = NSFetchRequest(entityName: "User")
var error: NSError?

// makes sure that objects are in the database before you fetch the last one
let result = managedObjectContext.executeFetchRequest(request, error: &error)
if let objects = result as? [User] {
    if let lastUser = objects.last { ... }
}


// 9) A better way to set objects in CoreData

// UIApplication is our top level selector for the application
// sharedApplication is one and only one (singleton) instance,
// then we get the delegate property
let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
let managedObjectContext = appDelegate.managedObjectContext!

let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: managedObjectContext) as User

// store everything from the session in CoreData,
user.name = "Zack Shapiro"
user.hometown = "Baltimore"
user.baseballTeam = "Orioles"

// trigger the save and account for a potential error
var error : NSError?
if !managedObjectContext.save(&error) {
    println("save failed: \(error?.localizedDescription)")
}


// 10) prevent your phone from going to sleep, good if you don't want the user
// getting to the lock screen
UIApplication.sharedApplication().idleTimerDisabled = true


// more coming soon