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
    let majorPickerData = ["Biomedical Engineering", "Computer Science", "Economics"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let gradient: CAGradientLayer = CAGradientLayer()
        //gradient.frame = self.view.bounds
        //gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
        //self.view.layer.insertSublayer(gradient, at: 0)
        setupPicker(picker: majorPicker)
        
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
        return majorPickerData.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return majorPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        majorLabel.text = "Major: " + majorPickerData[row]
    }


}

