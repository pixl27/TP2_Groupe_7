//
//  CountriesTableTableViewController.swift
//  TP2_Groupe_7
//
//  Created by mbds on 20/03/2021.
//

import UIKit

class CountriesTableTableViewController: UITableViewController {
    var numberOfRowsAtSection: [Int] = []
    var array2d = [[Country]]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        var nombredecontinent = [String]()
        for country in countries{
            if(!nombredecontinent.contains(country.continent)){
                nombredecontinent.append(country.continent)
            }
        }
        return nombredecontinent.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var nombredecontinent = [String]()
        var nombrechaquecontinent = 0
        for country in countries{
            if(!nombredecontinent.contains(country.continent)){
                nombredecontinent.append(country.continent)
            }
           
        }
        for n in nombredecontinent{
            for country in countries{
              
                if(n==country.continent){
                    nombrechaquecontinent += 1
                }
                
          }
            numberOfRowsAtSection.append(nombrechaquecontinent)
            nombrechaquecontinent = 0
        }
        var rows: Int = 0
           if section < numberOfRowsAtSection.count {
               rows = numberOfRowsAtSection[section]
           }

           return rows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
      
        
        var nombredecontinent = [String]()
        var nombrechaquecontinent = [Country]()
        for country in countries{
            if(!nombredecontinent.contains(country.continent)){
                nombredecontinent.append(country.continent)
            }
           
        }
        for n in nombredecontinent{
            for country in countries{
              
                if(n==country.continent){
                    nombrechaquecontinent.append(country)
                }
                
          }
            array2d.append(nombrechaquecontinent)
            nombrechaquecontinent = []
        }
        

        
    
        cell.textLabel?.text = array2d[indexPath.section][indexPath.row].name
        cell.detailTextLabel?.text = array2d[indexPath.section][indexPath.row].isoCode
           cell.imageView?.image = UIImage(named: array2d[indexPath.section][indexPath.row].isoCode)
        return cell
                
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var nombredecontinent = [String]()
        for country in countries{
            if(!nombredecontinent.contains(country.continent)){
                nombredecontinent.append(country.continent)
            }
        }
        return "\(nombredecontinent[section])"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
