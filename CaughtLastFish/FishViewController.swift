//
//  FishViewController.swift
//  CaughtLastFish
//
//  Created by zhenghui xie on 7/12/16.
//  Copyright © 2016 edu. All rights reserved.
//

import UIKit
import ImageIO
import AVFoundation

var backgroundMusicPlayer = AVAudioPlayer()

func playBackgroundMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
    guard let newURL = url else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    } catch let error as NSError {
        print(error.description)
    }
}

extension UIImage {
    
    public class func gifWithData(data: NSData) -> UIImage? {
        // Create source from data
        guard let source = CGImageSourceCreateWithData(data, nil) else {
            print("SwiftGif: Source for the image does not exist")
            return nil
        }
        
        return UIImage.animatedImageWithSource(source)
    }
    
    public class func gifWithURL(gifUrl:String) -> UIImage? {
        // Validate URL
        guard let bundleURL:NSURL? = NSURL(string: gifUrl)
            else {
                print("SwiftGif: This image named \"\(gifUrl)\" does not exist")
                return nil
        }
        
        // Validate data
        guard let imageData = NSData(contentsOfURL: bundleURL!) else {
            print("SwiftGif: Cannot turn image named \"\(gifUrl)\" into NSData")
            return nil
        }
        
        return gifWithData(imageData)
    }
    
    public class func gifWithName(name: String) -> UIImage? {
        // Check for existance of gif
        guard let bundleURL = NSBundle.mainBundle()
            .URLForResource(name, withExtension: "gif") else {
                print("SwiftGif: This image named \"\(name)\" does not exist")
                return nil
        }
        
        // Validate data
        guard let imageData = NSData(contentsOfURL: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gifWithData(imageData)
    }
    
    class func delayForImageAtIndex(index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        // Get dictionaries
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionaryRef = unsafeBitCast(
            CFDictionaryGetValue(cfProperties,
                unsafeAddressOf(kCGImagePropertyGIFDictionary)),
            CFDictionary.self)
        
        // Get delay time
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                unsafeAddressOf(kCGImagePropertyGIFUnclampedDelayTime)),
            AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                unsafeAddressOf(kCGImagePropertyGIFDelayTime)), AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1 // Make sure they're not too fast
        }
        
        return delay
    }
    
    class func gcdForPair(a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        // Check if one of them is nil
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        // Swap for modulo
        if a < b {
            let c = a
            a = b
            b = c
        }
        
        // Get greatest common divisor
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b! // Found it
            } else {
                a = b
                b = rest
            }
        }
    }
    
    class func gcdForArray(array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImageRef]()
        var delays = [Int]()
        
        // Fill arrays
        for i in 0..<count {
            // Add image
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            // At it's delay in cs
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                                                            source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        // Calculate full duration
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        // Get frames
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(CGImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        // Heyhey
        let animation = UIImage.animatedImageWithImages(frames,
                                                        duration: Double(duration) / 1000.0)
        
        return animation
    }
    
}

class FishViewController: UIViewController{
    
    //create fish gif
    let fishGif = UIImage.gifWithName("fish")!
    /*lazy var fish3 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish2 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish1 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish6 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish5 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish4 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish9 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish8 : UIImageView = UIImageView(image: self.fishGif)
    lazy var fish7 : UIImageView = UIImageView(image: self.fishGif)*/
    
    //create UIImageViews for fish
    @IBOutlet weak var fish1: UIImageView!
    @IBOutlet weak var fish2: UIImageView!
    @IBOutlet weak var fish3: UIImageView!
    @IBOutlet weak var fish4: UIImageView!
    @IBOutlet weak var fish5: UIImageView!
    @IBOutlet weak var fish6: UIImageView!
    @IBOutlet weak var fish7: UIImageView!
    @IBOutlet weak var fish8: UIImageView!
    @IBOutlet weak var fish9: UIImageView!
    
    //invisible box around fishes for hook alignment
    @IBOutlet weak var fishBox: UIImageView!
    
    
    var fishes: [UIImageView] = []
    
    var playerturn = true
    
    //hooks
    @IBOutlet weak var fishhook1: UIImageView!
    
    @IBOutlet weak var fishhook2: UIImageView!

    @IBOutlet weak var fishhook3: UIImageView!
    
    //game over images
    
    @IBOutlet weak var gameover: UIImageView!
    
    @IBOutlet weak var face: UIImageView!
    
    var hooks: [UIImageView] = []
    var hookcenters: [CGPoint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add fish to screen
        //first row
        
        /*fish1.frame = CGRect(x: 30.0, y: 200.0, width: 100.0, height: 80.0)
        view.addSubview(fish1)
        
        
        fish2.frame = CGRect(x: 150.0, y: 200.0, width: 100.0, height: 80.0)
        view.addSubview(fish2)
        
        fish3.frame = CGRect(x: 270.0, y: 200.0, width: 100.0, height: 80.0)
        view.addSubview(fish3)
        
        //second row
        
        fish4.frame = CGRect(x: 30.0, y: 330.0, width: 100.0, height: 80.0)
        view.addSubview(fish4)
        
        fish5.frame = CGRect(x: 150.0, y: 330.0, width: 100.0, height: 80.0)
        view.addSubview(fish5)
        
        fish6.frame = CGRect(x: 270.0, y: 330.0, width: 100.0, height: 80.0)
        view.addSubview(fish6)
        
        //third row
        
        fish7.frame = CGRect(x: 30.0, y: 460.0, width: 100.0, height: 80.0)
        view.addSubview(fish7)
        
        fish8.frame = CGRect(x: 150.0, y: 460.0, width: 100.0, height: 80.0)
        view.addSubview(fish8)
        
        fish9.frame = CGRect(x: 270.0, y: 460.0, width: 100.0, height: 80.0)
        view.addSubview(fish9)*/
        fish1.image = fishGif
        fish2.image = fishGif
        fish3.image = fishGif
        fish4.image = fishGif
        fish5.image = fishGif
        fish6.image = fishGif
        fish7.image = fishGif
        fish8.image = fishGif
        fish9.image = fishGif
        
        fishes =  [fish1, fish2, fish3, fish4, fish5, fish6, fish7, fish8, fish9]
        hooks = [fishhook1, fishhook2, fishhook3]
        
        playBackgroundMusic("UnderTheSeaInstrumental.mp3")
        
        //save original location of hooks

        
        

        // Do any additional setup after loading the view.

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        hookcenters = [fishhook1.center, fishhook2.center, fishhook3.center]
        
    }
    
    
    
    
    func catchFish (fish: UIImageView, hook: UIImageView, col: Int, row: Int, com: Bool) {
        //move hook down
        UIView.animateWithDuration(1.0,
            delay: 0.0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                let dist = self.fishBox.frame.origin.y - (hook.frame.origin.y + hook.frame.size.height)
                var newCenter = hook.center
                newCenter.y += dist
                hook.center = newCenter
            }, completion: {
                //rotate fish
                (value: Bool) in
                UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                    fish.transform = CGAffineTransformMakeRotation((-90 * CGFloat(M_PI)) / 180.0)
                    }, completion: {
                        //move fish to hook
                        (value: Bool) in
                        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            /*var newCenter = fish.center
                            newCenter.y -= CGFloat(56 + 130 * row)
                            fish.center = newCenter*/
                            var newCenter = fish.center
                            newCenter.y = hook.frame.origin.y + hook.frame.size.height
                            fish.center = newCenter
                            }, completion: {
                                //move fish and hook up
                                (value:Bool) in
                                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    var newCenter = fish.center
                                    newCenter.y = self.hookcenters[col].y + hook.frame.size.height / 2
                                    fish.center = newCenter
                                    }, completion: {
                                        (value: Bool) in
                                        fish.image = nil
                                })
                                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                    hook.center = self.hookcenters[col]
                                    }, completion: {
                                        //computer turn
                                        (value: Bool) in
                                        //reset hook location
                                        UIView.animateWithDuration(0.0, animations: {
                                            hook.center = self.hookcenters[col]
                                        })
                                        UIView.animateWithDuration(0.0, delay: 1.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                                            
                                            }, completion: {
                                                //if there are still fish left...
                                                (value: Bool) in
                                                if (com) {
                                                    if(self.fishes[8].image != nil) {
                                                        self.comp()
                                                    }
                                                        
                                                        // player wins
                                                    else {
                                                        self.gameover.image = UIImage(named: "img_you_win")
                                                        self.face.image = UIImage(named: "smile")
                                                    }

                                                }
                                                
                                        })
                                })
                        })
                })
        })
    }
    
    
    @IBAction func onePressed(sender: AnyObject) {
        if (playerturn) {for i in 0...8 {
            playerturn = false
            if(fishes[i].image != nil) {
                let hooknum = i % 3
                let column = hooknum
                let rownum = i / 3
                catchFish(fishes[i], hook: hooks[hooknum], col: column, row: rownum, com: true)
                break
            }
        } }
        
            }

    @IBAction func twoPressed(sender: AnyObject) {
        if (playerturn) {for i in 0...8 {
            playerturn = false
            if(fishes[i].image != nil) {
                var hooknum = i % 3
                var column = hooknum
                var rownum = i / 3
                catchFish(fishes[i], hook: hooks[hooknum], col: column, row: rownum, com: false)
                let j = i + 1
                hooknum = j % 3
                column = hooknum
                rownum = j / 3
                catchFish(fishes[j], hook: hooks[hooknum], col: column, row: rownum, com: true)
                break
            }
        }}

    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        backgroundMusicPlayer.stop()
    }
    //computer's turn
    func comp() {
        
        //if there's at least 2 fish...
        
        if(fishes[7].image != nil) {
            let rand = Int(arc4random_uniform(2))
            for i in 0...8 {
                if(fishes[i].image != nil) {
                    let j = i + rand
                    for h in i...j {
                        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                            var newCenter = self.fishes[h].center
                            newCenter.x = 440
                            self.fishes[h].center = newCenter
                            }, completion: {
                                (value: Bool) in
                                self.fishes[h].image = nil
                                //computer win??
                                if (self.fishes[8].image == nil) {
                                    self.gameover.image = UIImage(named: "game-over")
                                    self.face.image = UIImage(named: "frown")
                                }
                                self.playerturn = true
                        })
                    }
                    break
                }
            }

        }
            
        //if there's only 1 fish...
            
        else {
            UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                var newCenter = self.fishes[8].center
                newCenter.x = 440
                self.fishes[8].center = newCenter
                }, completion: {
                    (value: Bool) in
                    self.fishes[8].image = nil
                    self.gameover.image = UIImage(named: "game-over")
                    self.face.image = UIImage(named: "frown")
            })
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


