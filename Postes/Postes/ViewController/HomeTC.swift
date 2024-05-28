//
//  HomeTC.swift
//  Postes
//
//  Created by Krupesh Savaliya on 28/05/24.
//

import UIKit

class HomeTC: UITableViewCell {
    
    @IBOutlet weak var viewMain: UIView! {
        didSet {
            viewMain.layer.shadowColor = UIColor.lightGray.cgColor
            viewMain.layer.shadowOpacity = 0.8
            viewMain.layer.shadowOffset = .zero
            viewMain.layer.shadowRadius = 6
            viewMain.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    var celldata : Post? {
        didSet {
            setupUI()
        }
    }
    var computedData: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func  setupUI() {
        if let data = celldata {
            lblTitle.text = data.title
            lblId.text = "\(data.id)"
            
            if let computedData = computedData {
                self.lblBody.text = computedData
            } else {
                DispatchQueue.global(qos: .userInitiated).async {
                    let computedData = self.performHeavyComputation(for: data)
                    DispatchQueue.main.async {
                        self.lblBody.text = computedData
                        self.computedData = computedData
                    }
                }
            }
        }
    }
    
    func performHeavyComputation(for post: Post) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        sleep(1)
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time taken for computation: \(timeElapsed) seconds")
        return "computation: \(String(format: "%.4f", timeElapsed)) seconds"
    }
    
    

    
    
}
