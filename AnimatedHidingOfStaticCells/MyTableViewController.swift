//
//  MyTableViewController.swift
//  
//
//  Created by Sergey Skoblikov on 02.07.2015.
//
//

import UIKit

class MyTableViewController: UITableViewController {

    @IBOutlet weak var hiddenCellsSwitch: UISwitch!
    var hiddenCellsAreShown: Bool = false
    @IBOutlet weak var parentCell: UITableViewCell!
    
    @IBOutlet weak var hiddenCell1: UITableViewCell!
    @IBOutlet weak var hiddenCell2: UITableViewCell!
    var hiddenCell1IndexPath: NSIndexPath?
    var hiddenCell2IndexPath: NSIndexPath?

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let result = super.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if result === hiddenCell1 {
            hiddenCell1IndexPath = indexPath
        } else if result === hiddenCell2 {
            hiddenCell2IndexPath = indexPath
        } else if result === parentCell {
            hiddenCellsSwitch.on = hiddenCellsAreShown
        }
        return result
    }

    @IBAction func onHiddenCellsSwitchChanged(sender: UISwitch) {
        hiddenCellsAreShown = sender.on
        // this will trigger the animation
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // calling tableView.cellForRowAtIndexPath: leads to stack overflow.
        // So chached indexes are used to identify cells.
        if !hiddenCellsAreShown && (indexPath == hiddenCell1IndexPath || indexPath == hiddenCell2IndexPath) {
            return 0
        }
        
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
