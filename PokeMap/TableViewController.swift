//
//  TableViewController.swift
//  PokeMap
//
//  Created by Jake Wojtas on 6/27/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapButton: UIButton!
    
    var caughtPokemon : [Pokemon] = []
    var uncaughtPokemon : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        caughtPokemon = getAllCaughtPokemon()
        uncaughtPokemon = getAllUncaughtPokemon()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mapButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getAllCaughtPokemon() -> [Pokemon] {
        return []
    }
    
    func getAllUncaughtPokemon() -> [Pokemon] {
        return []
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
