//
//  HomeVC.swift
//  Postes
//
//  Created by Krupesh Savaliya on 28/05/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tblPosts: UITableView!
    
    var posts: [Post] = []
    var currentPage = 1
    let limit = 10
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        	
        self.title = "Postes"
        tblPosts.register(UINib(nibName: "HomeTC", bundle: nil), forCellReuseIdentifier: "HomeTC")
        fetchPosts(page: currentPage)
    }
    
    

    func fetchPosts(page: Int) {
            isLoading = true
            NetworkManager.shared.fetchPosts(page: page, limit: limit) { [weak self] result in
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success(let posts):
                    self.posts.append(contentsOf: posts)
                    self.tblPosts.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return posts.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tblPosts.dequeueReusableCell(withIdentifier: "HomeTC", for: indexPath) as! HomeTC
           cell.celldata = posts[indexPath.row]
           return cell
       }
       
       func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
           if indexPath.row == posts.count - 1 && !isLoading {
               currentPage += 1
               fetchPosts(page: currentPage)
           }
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
           vc?.post = posts[indexPath.row]
           self.navigationController?.pushViewController(vc!, animated: true)
       }
       
      
}
