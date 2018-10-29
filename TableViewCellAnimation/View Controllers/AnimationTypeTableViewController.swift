//
//  AnimationTypeTableViewController.swift
//  UITableViewCellAnimation-Article-Starter
//
//  Created by Maxim Kovalko on 10/29/18.
//  Copyright © 2018 Vadim Bulavin. All rights reserved.
//

import UIKit

class AnimationTypeTableViewController: UITableViewController {
    
    let animations: [AnimationType] = [
        .fade(duration: 0.5, delayFactor: 0.05),
        .moveUpWithFade(rowHeight: 44, duration: 1, delayFactor: 0.05),
        .moveUpWithBounce(rowHeight: 44, duration: 1, delayFactor: 0.05),
        .slideIn(duration: 0.5, delayFactor: 0.05),
        .scale(duration: 1, delayFactor: 0.05)
    ]
    
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select Animation Type"
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = animations[indexPath.row].description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "showAnimation", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? TableViewController,
            let indexPath = selectedIndexPath else { return }
        destinationVC.animation = animations[indexPath.row]
    }

}
