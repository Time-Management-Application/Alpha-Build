//
//  SettingsTableViewController.swift
//  TMA
//
//  Created by Arvinder Basi on 5/25/17.
//  Copyright © 2017 Abdulrahman Sahmoud. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class SettingsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBAction func autoPopulate(_ sender: Any) {
        Helpers.populateData()
        
        let alert = UIAlertController(title: "Success", message: "Courses populated correctly", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            
            // IMPORTANT: This won't work on the simulator. Only on an actual device.
            let email = "support@ibackontrack.com"
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        }
        else if indexPath.section == 2 {
            let svc = SFSafariViewController(url: URL(string:"https://ibackontrack.com")!)
            present(svc, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
