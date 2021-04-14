import Foundation

struct CurrentWeather: Decodable
{
    var name: String
    var main: Main
    var weather: [Weather]
}

struct Weather: Decodable
{
    var id: Int
}

struct Main: Decodable
{
    var temp: Double
    var feelsLike: Double
    
    enum CodingKeys: String, CodingKey
    {
        case temp
        case feelsLike = "feels_like"
    }
}
