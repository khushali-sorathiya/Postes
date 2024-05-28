//
//  DetailsVC.swift
//  Postes
//
//  Created by Khushali on 28/05/24.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"

        if let data = post {
            lblTitle.text = data.title
            lblBody.text = data.body
            self.view.layoutIfNeeded()
        }
    }
    


}
