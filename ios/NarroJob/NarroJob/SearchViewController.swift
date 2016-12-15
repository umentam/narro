//
//  SearchViewController.swift
//  NarroJob
//
//  Created by Michael Umenta on 12/14/16.
//  Copyright © 2016 Michael Umenta. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var indPreferenceLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var majorPicker: UIPickerView!
    @IBOutlet weak var indPicker: UIPickerView!
    @IBOutlet weak var jobPicker: UIPickerView!
    
    @IBOutlet weak var industryStack: UIStackView!
    @IBOutlet weak var jobStack: UIStackView!
    
    @IBOutlet weak var gpaTextField: UITextField!
    
    
    var studentMajor: String!
    var studentInd: String!
    var studentJob: String!
    
    //MARK: Picker Data
    let majorPickerData = ["Biomedical Engineering", "Computer Science", "Economics"]
    
    // Industry Preferences
    var indData = [String]()
    let indDataBME = ["Research", "Environment", "Biochemical/Biomedical", "Entrepreneurship"]
    let indDataCS = ["Research", "Entrepreneurship", "Electronics", "Tech Info Systems"]
    let indDataEcon = ["Environment", "Entrepreneurship", "Investment Banking", "Venture Capatalism"]
    
    // Job Preferences
    var jobData = [String]()
    let jobDataBME = ["Engineering", "Healthcare/Health Services", "Research"]
    let jobDataCS = ["Hardware/Software", "Engineering", "Web Dev"]
    let jobDataEcon = ["Consulting", "Finance", "Project Management"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        setupPicker(picker: majorPicker)
        setupPicker(picker: indPicker)
        setupPicker(picker: jobPicker)
        self.changeIndandJobPreferences(major: "Biomedical Engineering")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupPicker(picker: UIPickerView){
        picker.dataSource = self
        picker.delegate = self
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return majorPickerData.count
        }
        else if (pickerView.tag == 2){
            return indData.count
        }
        else {
            return jobData.count
        }
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return majorPickerData[row]
        }
        else if (pickerView.tag == 2){
            return indData[row]
        }
        else {
            return jobData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1){
            let major = majorPickerData[row]
            //majorLabel.text = "Major: " + major
            studentMajor = major
            changeIndandJobPreferences(major: major)
            industryStack.isHidden = false
        }
        else if (pickerView.tag == 2){
            let pref = indData[row]
            //indPreferenceLabel.text  = "Ind Pref: " + pref
            studentInd = pref
            jobStack.isHidden = false
        }
        else {
            let pref = jobData[row]
            //jobLabel.text = "Job Pref: " + pref
            studentJob = pref
            gpaTextField.isHidden = false
        }
    }
    
    func changeIndandJobPreferences (major: String){
        if (major == "Biomedical Engineering"){
            indData = indDataBME
            jobData = jobDataBME
        }
        else if (major == "Computer Science"){
            indData = indDataCS
            jobData = jobDataCS
        }
        else {
            indData = indDataEcon
            jobData = jobDataEcon
        }
        indPicker.reloadAllComponents()
        jobPicker.reloadAllComponents()
        
    }

    @IBAction func sendData(_ sender: AnyObject) {
        let gpa = gpaTextField.text
        let credentials = "Major: " + studentMajor + " Ind: " + studentInd + " Job: " + studentJob
        print (credentials)
        print ("GPA: " + gpa!)
    }

}

