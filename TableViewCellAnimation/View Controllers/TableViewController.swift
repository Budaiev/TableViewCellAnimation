//
//  TableViewController.swift
//  UITableViewCellAnimation-Article
//
//  Created by Vadym Bulavin on 9/4/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var animation: AnimationType = .fade(duration: 0, delayFactor: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = animation.description
    }

	@IBAction func onRefresh(_ sender: UIBarButtonItem) {
		tableView.reloadData()
	}

	// MARK: - Table view data source and delegate methods

	override func tableView(_ tableView: UITableView,
                            willDisplay cell: UITableViewCell,
                            forRowAt indexPath: IndexPath) {
        let animator = Animator(animation: animation.animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
	}
}
