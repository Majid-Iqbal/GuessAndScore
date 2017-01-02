//
//  AboutViewController.swift
//  GuessEye
//
//  Created by Majid Iqbal on 04/10/2016.
//  Copyright © 2016 CodeMania. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet var webView :UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlStr = Bundle.main.path(forResource: "BullsEye", ofType:"html"){
            
            if let htmlData = NSData(contentsOfFile: htmlStr){
                
            let baseUrl = NSURL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData as Data, mimeType:"text/html", textEncodingName:"UTF-8", baseURL: baseUrl as URL)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func close(){
        
        dismiss(animated: true, completion: nil)
    }
    
}
