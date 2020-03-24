//
//  ViewController.swift
//  WebViewExample
//
//  Created by Anmol singh on 2020-03-24.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var iWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lambtonURL()
               
    
    }
    
    func loadHtml(){
       let htmlString = "<h1>Hello World</h1>"
        iWebView.loadHTMLString(htmlString, baseURL: nil)
//        iWebView.backForwardList
    }

    func lambtonURL(){
        let url = URL(string: "https://www.lambtoncollege.ca")
        let urlRequest = URLRequest(url: url!)
        iWebView.load(urlRequest)
    }
    
    @IBAction func iHistory(_ sender: UIBarButtonItem) {
        if iWebView.canGoBack
        {
            let historyList =  iWebView.backForwardList.backList
            HistoryTableViewController.urls = historyList
//            if historyList.count > 0
//            {
//                for item in historyList {
//                    print("\(String(describing: item.title)) -  \(item.url.absoluteURL)")
//                }
//            }
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let historyVC = sb.instantiateViewController(identifier: "historyVC") as! HistoryTableViewController
        self.navigationController?.pushViewController(historyVC, animated: true)    }
    
    @IBAction func iToolBar(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            iWebView.reloadFromOrigin()
        case 1:
            if iWebView.canGoBack{
                iWebView.goBack()
                
            } else{
                
            }
        case 2:
            if iWebView.canGoForward{
                iWebView.goForward()
            }else{
                
            }
        case 3:
            iWebView.reload()
        default:
            print("No action found")
        }
    }
    
}

