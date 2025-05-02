import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    private let apiKey = "a087071659f2e5a8c7639ced48d2a80e"
    private let baseURL = "https://api.openweathermap.org/data/2.5"
    
    var deligate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(baseURL)/weather?q=\(cityName)&units=metric&appid=\(apiKey)"
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
                print("Error: \(error!)")
                return
            }
            
            if let safeData = data {
                if let weather = self.parseJSON(safeData) {
                    self.deligate?.didUpdateWeather(weather: weather)
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
            print("Failed to decode: \(error)")
            return nil
        }
    }
}
