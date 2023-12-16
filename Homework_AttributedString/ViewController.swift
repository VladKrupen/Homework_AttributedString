//
//  ViewController.swift
//  Homework_AttributedString
//
//  Created by Vlad on 16.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "Каждый охотник желает знать где сидит фазан"
        
        let arrayWord: [String] = textView.text.components(separatedBy: " ")
        print(arrayWord)
        
        let arrayColor: [UIColor] = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.systemBlue, UIColor.blue, UIColor.purple]
        
        let attributedString = NSMutableAttributedString(string: textView.text)
        
        attributedString.addAttribute(.font, value: UIFont(name: "RubikLines-Regular", size: 40)!, range: NSRange(location: 0, length: textView.text.count))
        
        
        for num in 0..<arrayWord.count {
            if let location = textView.text.firstRange(of: "\(arrayWord[num])") {
                let lowerBound = location.lowerBound.encodedOffset
                let length = location.upperBound.encodedOffset - lowerBound
                attributedString.addAttribute(.foregroundColor, value: arrayColor[num], range: NSRange(location: lowerBound, length: length))
            }
        }
                                      
        
        textView.attributedText = attributedString
        

    }


}

