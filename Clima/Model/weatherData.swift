
import Foundation


/* Creat the structure that the weather data is going to come back in... our STRUCT creates these variables, and these variables are how we create
 the following structs and tap inside of the info on the page. ( EX1‼️ ) of this at bottom of code*/
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]                                        // [Weather] signifies an array of weather conditions, and that is why it has the [] to show array
    
}


struct Main: Codable {                                          // Decodable is a good example of aa protocol - it gets the certificate that it can decode itself
    let temp: Double
    
}

struct Weather: Codable {
    let description: String
    let id: Int                                       //id is connected to websites Weather Codes EX.200-210 ~ ThunderStorms, we know what image to display on UI based off that
}





 

/*
 Our wather Data is now Decodable & has a property called name
 (EX.1‼️)                  let weather: [Weather]
            ~⸚ this taps into our Array of weather objects from our webiste. We declared the variable, that maps to the info from the website.
                        struct Weather: Decodable {
            ~⸚this object is created from  --- let weather: [Weather]  --> and then maps into a specific data
                from the array of weather descriptions we have from our original STRUCT (( struct WeatherData: Decodable {  🤯 ))
 
 */
