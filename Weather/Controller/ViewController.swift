import UIKit

class ViewController: UIViewController, ChangeCityNameProtocol
{
    let datafetcher = DataFetcher()
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var feelsLikeTemperature: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    private var alert = SearchAlert()
    
    @IBAction func searchButtonTapped()
    {
        alert.delegateForCityName = self
        alert.showAlert(inView: self.view)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        changeCityName(newName: "London")
    }
    
    func changeCityName(newName: String)
    {
        datafetcher.fetchData(withCity: newName)
        {   (currentWeather) in
            
            DispatchQueue.main.async
            {
                self.updateInterface(currentWeather: currentWeather)
            }
        }
    }
    
    func updateInterface(currentWeather: CurrentWeather)
    {
        self.cityName.text = currentWeather.name
        
        self.temperature.text = String(format: "%.0f", currentWeather.main.temp) + " C"
        self.feelsLikeTemperature.text = "feels like " +  String(format: "%.0f", currentWeather.main.feelsLike) + " C"
        
        var imageName = ""
        var backGroundImageName = ""
        
        switch currentWeather.weather.first!.id
        {
        case 200...232: imageName = "cloud.bolt.rain.fill"; backGroundImageName = "rain"
        case 300...321: imageName = "cloud.drizzle.fill"; backGroundImageName = "rain"
        case 500...531: imageName = "cloud.rain.fill"; backGroundImageName = "rain"
        case 600...622: imageName = "cloud.snow.fill"; backGroundImageName = "snow"
        case 701...781: imageName = "smoke.fill"; backGroundImageName = "tuman"
        case 800: imageName = "sun.min.fill"; backGroundImageName = "sun"
        case 801...804: imageName = "cloud.fill"; backGroundImageName = "cloud"
        default:
            imageName = "nosign"
            backGroundImageName = ""
        }
        
        self.weatherImage.image = UIImage(systemName: imageName)
        self.backgroundImage.image = UIImage(named: backGroundImageName)
    }
}



