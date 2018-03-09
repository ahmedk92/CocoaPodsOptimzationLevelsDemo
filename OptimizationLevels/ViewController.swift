//
//  ViewController.swift
//  OptimizationLevels
//
//  Created by admin on 3/5/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SwiftSoup

extension String {
    var logified: String {
        return "\(Date()): \(self)\n"
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var outputTextView: UITextView!
    
    private func test() {
        outputTextView.text = "Test started.".logified
        outputTextView.text.append("Will read HTML file into a String...".logified)
        DispatchQueue.global(qos: .default).async {
            let html = try! String(contentsOf: Bundle.main.url(forResource: "Architecture of Seattle - Wikipedia", withExtension: "htm")!)
            DispatchQueue.main.async {
                self.outputTextView.text.append("Will parse HTML String with SwiftSoup...".logified)
            }
            let document = try! SwiftSoup.parse(html)
            
            DispatchQueue.main.async {
                self.outputTextView.text.append("Will extract text with SwiftSoup...".logified)
            }
            
            let _ = try! document.text()
            
            DispatchQueue.main.async {
                self.outputTextView.text.append("Done.".logified)
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

