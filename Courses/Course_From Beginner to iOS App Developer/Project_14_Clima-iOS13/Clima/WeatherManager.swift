import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    private let apiKey = "a087071659f2e5a8c7639ced48d2a80e"
    private let baseURL = "https://api.openweathermap.org/data/2.5"
    
    var deligate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(baseURL)/weather?q=\(cityName)&units=metric&appid=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(baseURL)/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(apiKey)"
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL:", urlString)
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) {(data, response, error) in
            if error != nil {
                self.deligate?.didFailWithError(error!)
                return
            }
            
            if let safeData = data {
                if let weather = self.parseJSON(safeData) {
                    self.deligate?.didUpdateWeather(self, weather)
                }
            }
        }
        
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id;
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            deligate?.didFailWithError(error)
            return nil
        }
    }
}
