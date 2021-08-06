//
//  AddFlightTableViewController.swift
//  Flytickets
//
//  Created by Shelley Gertrudis on 8/6/21.
//  Copyright © 2021 Shelley Gertrudis. All rights reserved.
//

import UIKit

class AddFlightTableViewController: UITableViewController {
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberofChildrenStepper: UIStepper!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var depatureDataLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var frequentFlyernuber: UITextField!
    @IBOutlet weak var returnDatePicker: UIDatePicker!
    @IBOutlet weak var depatureDatePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        depatureDatePicker.minimumDate = midnightToday
        updateDateViews()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let depaturreDate = depatureDatePicker.date
        let returnDate = returnDatePicker.date
        
    }
    @IBAction func doneStepperTapped(_ sender: Any) {
        updateNumberOfPassengers()
    }
    func updateNumberOfPassengers(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberofChildrenStepper.value))"
    }
    func updateDateViews(){
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .medium
        depatureDataLabel.text = dataFormatter.string(from: depatureDatePicker.date)
        returnDatePicker.minimumDate = depatureDatePicker.date.addingTimeInterval(86400)
        returnDateLabel.text = dataFormatter.string(from: returnDatePicker.date)
    }
    @IBAction func datepickertouch(_ sender: UIDatePicker) {
        updateDateViews()
    }
    let depatureDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let returnDatePickerCellIndexPath = IndexPath(row:3, section: 1)
    var isDepatureDatePickerShown = false{
        didSet{
            depatureDatePicker.isHidden = !isDepatureDatePickerShown
        }
    }
    var isReturnDatePickerShown = false{
        didSet{
            returnDatePicker.isHidden = !isReturnDatePickerShown
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case depatureDatePickerCellIndexPath:
            if isDepatureDatePickerShown{
                return 216.00
            }
            else{
                return 0.0
            }
        case returnDatePickerCellIndexPath:
            if isReturnDatePickerShown{
                return 216.00
            }
            else{
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    let depatureDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let returnDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath{
        case depatureDateLabelCellIndexPath:
            isDepatureDatePickerShown.toggle()
            if isDepatureDatePickerShown{
                isReturnDatePickerShown = false
            }
        case returnDateLabelCellIndexPath:
            isReturnDatePickerShown.toggle()
            if isReturnDatePickerShown{
                isDepatureDatePickerShown = false
            }
        default:
            break
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
