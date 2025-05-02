import Foundation

struct WeatherManager {
    private let apiKey = "a087071659f2e5a8c7639ced48d2a80e"
    private let baseURL = "https://api.openweathermap.org/data/2.5"
    
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
        
        let task = session.dataTask(with: url, completionHandler: handle)
        
        task.resume()
    }
    
    private func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print("Error: \(error!)")
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print("Data: \(String(describing: dataString))")
        }
    }
}
