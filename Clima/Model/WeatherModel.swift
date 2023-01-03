/*
 Using this to clean up Code ++ Be in accordance with the MVC Architectue
 Model what a weather object should look like;  created as a STRUCT
 Created this Model to hold our Weather Data
 
 
 */

import Foundation

        struct WeatherModel {
//STORED PROPERTIES: Just store pieces of data
            let conditionId: Int
            let cityName: String
            let temperature: Double
    
            
            var temperatureString: String {
                return String(format: "%.1f", temperature)

            }
            
            
            
            
// COMPUTED PROPERTIES - created with var;    the var conditionName is going to figure out its value based on what the switch statement returns.
            var conditionName: String {
                
            switch conditionId {
                    case 200...232:
                        return "cloud.bolt"
                    case 300...321:
                        return "cloud.drizzle"
                    case 500...531:
                        return "cloud.rain"
                    case 600...622:
                        return "cloud.snow"
                    case 701...781:
                        return "cloud.fog"
                    case 800:
                        return "sun.max"
                    case 801...804:
                        return "cloud.bolt"
                    default:
                        return "cloud"
                }
            }
}
    
        /*func getConditionName(weatherId: Int) -> String {             //This function checks the weather codes from website, and based on the value categorizes it with a set image
            switch weatherId {                                    /* Switch case to handle & test each set of # iD's, within a Range (EX. 200...232) & return a string to know                                                                                  which Image to pick */
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                        return "cloud"*/

