//
//  memorizeNotesViewController.swift
//  CaughtLastFish
//
//  Created by zhenghui xie on 7/14/16.
//  Copyright © 2016 edu. All rights reserved.
//

import UIKit

class memorizeNotesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var items = ["1", "2", "3", "4"]
    
    @IBOutlet weak var backButton: UIButton!
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

    var notesButton: [UIButton] = []
    
    let kbNoteImageArray = ["kb-note-a.png", "kb-note-b.png", "kb-note-c.png", "kb-note-d.png", "kb-note-e.png", "kb-note-f.png", "kb-note-g.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backButton.layer.cornerRadius = 8;
        backButton.layer.masksToBounds = true;
        backButton.layer.borderWidth = 1

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //Level of game starts at 1
    var iconImage = UIImage(named: "kb-note-c.png")
    var inGame = false
    var counter = 0
    
    //Which platform we set down an image on really quickly.
    var chosenPlatform = -1
    
    //This platform array tells us which platform we are dealing with.
    var platformArray : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    
    //This array holds the platform positions that were chosen, the user input will be checked against this.
    var checkArray : [Int] = []
    
    //This array holds the user's button presses.
    var userArray: [Int] = []
    
    var checkElement = 0
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    //When we first set up the game, we will want to pick a random platform + random image to display on the platform. Since we're still in prototype, we will just take iconImage for now.
    func setup() {
        userLostClearScreen()
        counter = 0
        userArray = []
        checkArray = []
        print("did i get here?")
        var count = 0
        
        let randomIndex = Int(arc4random_uniform(UInt32(platformArray.count)))
        
        chosenPlatform = platformArray[randomIndex]
        
        checkArray.append(chosenPlatform)
        
        var delayTime = 0.2
        
        for element in checkArray {
            
            checkElement = element
            
            let randomImage = Int(arc4random_uniform(7))
            var image = UIImage(named: kbNoteImageArray[randomImage])
            
            let noImage = UIImage(named: "none.png") as UIImage!
            
            if element == 0 {
                self.delay(delayTime) {
                    self.platformZeroImage.image = image
                }
                
                delayTime = delayTime + 1
                
                self.delay(delayTime) {
                    self.platformZeroImage.image = noImage
                }
                
                delayTime = delayTime + 1
            } else if element == 1 {
                self.delay(delayTime++) {
                    self.platformOneImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformOneImage.image = noImage
                    
                }
                
            } else if element == 2 {
                self.delay(delayTime++) {
                    self.platformTwoImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformTwoImage.image = noImage
                    
                }
                
            } else if element == 3 {
                
                self.delay(delayTime++) {
                    self.platformThreeImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformThreeImage.image = noImage
                    
                }
                
            } else if element == 4 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformFourImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformFourImage.image = noImage
                    
                }
                
                
            } else if element == 5 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformFiveImage.image = image
                }
                
                
                self.delay(delayTime++) {
                    self.platformFiveImage.image = noImage
                }
                
            } else if element == 6 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformSixImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformSixImage.image = noImage
                    
                }
                
            } else if element == 7 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformSevenImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformSevenImage.image = noImage
                    
                }
                
                
            } else if element == 8 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformEightImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformEightImage.image = noImage
                    
                }
                
                
            } else if element == 9 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformNineImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformNineImage.image = noImage
                    
                }
                
            } else if element == 10 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformTenImage.image = image
                }
                
                self.delay(delayTime++) {
                    self.platformTenImage.image = noImage
                    
                }
                
                
            } else if element == 11 {
                print("should be right after my chosen platform???")
                self.delay(delayTime++) {
                    self.platformElevenImage.image = image
                    
                }
                
                self.delay(delayTime++) {
                    self.platformElevenImage.image = noImage
                    
                }
                
            }
            
            
            
        }
        
        disableButtons()
        delay(delayTime) {
            self.enableButtons()
            
        }
        print("check array is: ", checkArray)
        inGame = true
        
        
        
        
    }
    
    
 /*   func disableButtons() {
        platformZero.enabled = false
        platformOne.enabled = false
        platformTwo.enabled = false
        platformThree.enabled = false
        platformFour.enabled = false
        platformFive.enabled = false
        platformSix.enabled = false
        platformSeven.enabled = false
        platformEight.enabled = false
        platformNine.enabled = false
        platformTen.enabled = false
        platformEleven.enabled = false
    }
 
    func enableButtons() {
        platformZero.enabled = true
        platformOne.enabled = true
        platformTwo.enabled = true
        platformThree.enabled = true
        platformFour.enabled = true
        platformFive.enabled = true
        platformSix.enabled = true
        platformSeven.enabled = true
        platformEight.enabled = true
        platformNine.enabled = true
        platformTen.enabled = true
        platformEleven.enabled = true
    }
    */
    
    func userLostClearScreen() {
        /*
        let noImage = UIImage(named: "none.png") as UIImage!
        platformZeroImage.image = noImage
        platformOneImage.image = noImage
        platformTwoImage.image = noImage
        platformThreeImage.image = noImage
        platformFourImage.image = noImage
        platformFiveImage.image = noImage
        platformSixImage.image = noImage
        platformSevenImage.image = noImage
        platformEightImage.image = noImage
        platformNineImage.image = noImage
        platformTenImage.image = noImage
        platformElevenImage.image = noImage
 */
    }
    
    @IBAction func platformZeroPressed(sender: AnyObject) {
        print("nope")
        if inGame && platformZero.enabled {
            userArray.append(0)
            print(userArray)
            
            
            if userArray.count < checkArray.count {
                if userArray[counter] != checkArray[counter] {
                    print("Sorry you have lost! Wrong button pressed.")
                    levelUpImage.image = UIImage(named: "tryAgain.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    inGame = false
                    userLostClearScreen()
                    setup()
                    //need to instantiate other stuff to nil, maybe need a newGame function
                } else {
                    counter += 1
                }
                
            } else if userArray.count == checkArray.count {
                if userArray[counter] == checkArray[counter] {
                    print("Congratulations! Move on to the next level.")
                    level += 1
                    levelUpImage.image = UIImage(named: "levelUp.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    userLostClearScreen()
                    setup()
                    
                } else {
                    print("Sorry you have lost! Wrong button pressed.")
                    levelUpImage.image = UIImage(named: "tryAgain.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    inGame = false
                    level = 1
                    userLostClearScreen()
                    // need to instantiate other stuff to nil, maybe need a newGame function
                    setup()
                    
                    
                }
            }
            
            
            
        }
    }
    
    
    
    @IBAction func platformOnePressed(sender: AnyObject) {
        print("nope")
        if inGame && platformOne.enabled {
            userArray.append(1)
            print(userArray)
            
            if userArray.count < checkArray.count {
                if userArray[counter] != checkArray[counter] {
                    print("Sorry you have lost! Wrong button pressed.")
                    levelUpImage.image = UIImage(named: "tryAgain.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    inGame = false
                    level = 1
                    userLostClearScreen()
                    setup()
                    
                    //need to instantiate other stuff to nil, maybe need a newGame function
                } else {
                    counter += 1
                }
                
            } else if userArray.count == checkArray.count {
                if userArray[counter] == checkArray[counter] {
                    print("Congratulations! Move on to the next level.")
                    level += 1
                    levelUpImage.image = UIImage(named: "levelUp.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    userLostClearScreen()
                    setup()
                    
                    
                } else {
                    print("Sorry you have lost! Wrong button pressed.")
                    levelUpImage.image = UIImage(named: "tryAgain.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    inGame = false
                    level = 1
                    userLostClearScreen()
                    setup()
                    
                    
                    
                }
            }
        }
    }
    
    
    @IBAction func platformTwoPressed(sender: AnyObject) {
        print("nope")
        if inGame && platformTwo.enabled {
            userArray.append(2)
            print(userArray)
            
            
            if userArray.count < checkArray.count {
                if userArray[counter] != checkArray[counter] {
                    print("Sorry you have lost! Wrong button pressed.")
                    levelUpImage.image = UIImage(named: "tryAgain.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    inGame = false
                    level = 1
                    userLostClearScreen()
                    setup()
                    
                    //need to instantiate other stuff to nil, maybe need a newGame function
                } else {
                    counter += 1
                    
                }
                
            } else if userArray.count == checkArray.count {
                if userArray[counter] == checkArray[counter] {
                    print("Congratulations! Move on to the next level.")
                    userLostClearScreen()
                    level += 1
                    levelUpImage.image = UIImage(named: "levelUp.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    
                    
                    setup()
                    
                    
                } else {
                    print("Sorry you have lost! Wrong button pressed.")
                    levelUpImage.image = UIImage(named: "tryAgain.png")
                    self.delay(1) {
                        self.levelUpImage.image = UIImage(named: "none.png")
                    }
                    counter = 0
                    inGame = false
                    // need to instantiate other stuff to nil, maybe need a newGame function
                    level = 1
                    userLostClearScreen()
                    setup()
                    
                }
            }
            
        }
        
    }
    
    
    
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setup()
    }
}
