import Foundation

class Decoder
{
    func decodeJSON(withData data: Data, completion: @escaping (CurrentWeather) -> ())
    {
        let decoder = JSONDecoder()
        
        do
        {
            let currentWeather = try decoder.decode(CurrentWeather.self, from: data)
            completion(currentWeather)
        }
        catch
        {
            print("error")
        }
    }
}
