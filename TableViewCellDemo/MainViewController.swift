//
//  MainViewController.swift
//  TableViewCellDemo
//
//  Created by upway on 05/01/2023.
//

import UIKit

class MainViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
	
	var dataSource:[String] = ["1","1","1","1","1","1","1","1","1",]

	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: String(describing: MainTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MainTableViewCell.self))
        
    }
	func numberOfSections(in tableView: UITableView) -> Int {1}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {dataSource.count}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTableViewCell.self), for: indexPath)
		
		return cell
		
	}
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let action =  UIContextualAction(style: .normal, title: "del", handler: { (action,view,completionHandler ) in
			//do stuff
			completionHandler(true)
			self.dataSource.remove(at: indexPath.row)
			tableView.beginUpdates()
			tableView.deleteRows(at: [indexPath], with: .fade)
			tableView.endUpdates()
			
		})
		action.backgroundColor = .red
		let confrigation = UISwipeActionsConfiguration(actions: [action])
		return confrigation
	}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
