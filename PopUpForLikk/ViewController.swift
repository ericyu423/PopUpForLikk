//
//  ViewController.swift
//  PopUpForLikk
//
//  Created by eric yu on 6/30/19.
//  Copyright © 2019 eric yu. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController
{
    private struct StartingPopup
    {
        static let title = "Enjoy Likk"
        static let leftButtonTitle = "Not Really"
        static let rightButtonTitle = "Yes!"
    }
    
    private struct NegativePopup
    {
        static let title = "Would you mind giving us some feedback?"
        static let leftButtonTitle = "No, thanks"
        static let rightButtonTitle = "Ok, sure"
    }
    private struct PositivePopup
    {
        static let title = "How about rating on the App Store, then?"
        static let leftButtonTitle = "No, Thanks"
        static let rightButtonTitle = "Ok, sure"
    }
    
    private var startingAlert: UIAlertController!
    private var unhappyAlert: UIAlertController!
    private var happyAlert: UIAlertController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initAlerts()
    }

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        present(startingAlert, animated: true, completion: nil)
    }
    
    //for quick retest
    @IBAction func restartTapped(_ sender: UIButton)
    {
        present(startingAlert, animated: true, completion: nil)
    }
    
    private func initAlerts()
    {
        negativeAlert()
        positiveAlert()
        startAlert()
    }
    
}

extension ViewController
{
    func startAlert()
    {
        let left = UIAlertAction(title: StartingPopup.leftButtonTitle, style: .default)
        { _ in
            self.present(self.unhappyAlert, animated: true, completion: nil)
        }
        
        let right = UIAlertAction(title: StartingPopup.rightButtonTitle, style: .default)
        { _ in
            self.present(self.happyAlert, animated: true, completion: nil)
        }
        
        startingAlert = UIAlertController(title: StartingPopup.title, message: "", preferredStyle: .alert)
        startingAlert.addAction(left)
        startingAlert.addAction(right)
    }
    
    func positiveAlert()
    {
        let leftButton = UIAlertAction(title: PositivePopup.leftButtonTitle, style: .destructive, handler: nil)
        let rightButton = UIAlertAction(title: PositivePopup.rightButtonTitle, style: .default)
        { _ in
            SKStoreReviewController.requestReview()
        }
        
        happyAlert = UIAlertController(title: PositivePopup.title, message: "", preferredStyle: .alert)
        happyAlert.addAction(leftButton)
        happyAlert.addAction(rightButton)
    }
    
    func negativeAlert()
    {
        let leftButton = UIAlertAction(title: NegativePopup.leftButtonTitle, style: .destructive, handler: nil)
        let rightButton = UIAlertAction(title: NegativePopup.rightButtonTitle, style: .default)
        { _ in
            print("TODO: email")
        }
        
        unhappyAlert = UIAlertController(title: NegativePopup.title, message: "", preferredStyle: .alert)
        unhappyAlert.addAction(leftButton)
        unhappyAlert.addAction(rightButton)
    }
    
}


