//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

//UItextField Dlegate to be able to access our keyboard to be Able to hit go and it searches
class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var searchField: UITextField!
    
//creating a weathermanager that is equal to our WeatherManager struct from our MODEL
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//Tap in and alter our search field bar, and access the property:Delegate, and set it to this current class = the use of 'self' - MEANING our text field should report back to our view controller, which  lets the view controller know what is going on and communicates. The way we make sure the vc is notified by search field, is by setting the vc as the Delegate - Self refers to Current VC
        
        searchField.delegate = self
        weatherManager.delegate = self
    }


    @IBAction func searchButton(_ sender: UIButton) {
        //how to stop the keyboard from typing in search box once you are dpone typing
        searchField.endEditing(true)
       print(searchField.text!)
    }
    
    
// ask should the pressing of the Return button on keyboard to be processed
// this will print to our console what was typed in, and also, due to the "-> Bool" we must return a true or false value
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
//handles the return of Bool to satisfy function requirements
        return true
    }
    
    
    
    func textFieldShouldEndEditing(_ searchField: UITextField) -> Bool {
//this is saying if the Text inside of the text box DOES NOT = empty
        if searchField.text != "" {
            //then return true, which says yes this should End Editing
            return true
            // if that is not the case, our else statement handles if it is empty
        } else {
//A placeholder will pop up to remind user to enter something
            searchField.placeholder = "Type the location"
//false = no and will continue to edit
            return false
        }
    }
    
    
//delegate method to know to clear the text field after someone types and searches.
    func textFieldDidEndEditing(_ textField: UITextField) {
//use searchField.text ---to get the weather for that city
       if let city = searchField.text{                          // if let is a way to unwrap optional
           weatherManager.fetchWeather(cityName: city)          // our var from LINE20 is used to get weather and it accepts a city input
        }
        
        
        //resetting text field text
        searchField.text = ""
    }
    
//function that accepts us passing in our WeatherModel Object as the weather
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
// Dispatch Queue - designing our user interface - must use DispatchQueue to keep integrity of UI, while data Loads
        DispatchQueue.main.async {
                self.temperatureLabel.text = weather.temperatureString
            
            
/* To update the image to be displayed that corresponds to the weather condition
 we pulled this from our Weather Model with the COMPUTED PROPERTY:
            ' var conditionName: String {  '
 */
                self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }}
    
    func didFailWithError(error: Error) {
        print(error)
        
    }
    
}

