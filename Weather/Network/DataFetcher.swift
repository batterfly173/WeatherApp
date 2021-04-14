import Foundation

class DataFetcher
{
    let decoder = Decoder()
    
    func fetchData(withCity city: String, completion: @escaping (CurrentWeather) -> ())
    {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiKey)&units=metric"
        let url = URL(string: urlString)
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: url!)
        { (data, response, error) in
            self.decoder.decodeJSON(withData: data!, completion: completion)
        }
        
        task.resume()
    }
}
