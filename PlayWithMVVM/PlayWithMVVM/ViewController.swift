//
//  ViewController.swift
//  PlayWithMVVM
//
//  Created by Do Hoang Viet on 2/28/19.
//  Copyright © 2019 Do Hoang Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cars: [CarViewModel] = (UIApplication.shared.delegate as! AppDelegate).cars
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadImage(cell: UITableViewCell, photoURL: URL?) {
        DispatchQueue.global().async {
            if let imageURL = photoURL, let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: data)
                    cell.setNeedsLayout()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        let carViewModel = cars[indexPath.row]
        
        cell.textLabel?.text = carViewModel.titleText
        cell.detailTextLabel?.text = carViewModel.horsepowerText
        loadImage(cell: cell, photoURL: carViewModel.photoURL)

        return cell
    }
}

