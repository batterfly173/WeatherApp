import Foundation
import UIKit
import TinyConstraints

protocol ChangeCityNameProtocol
{
    func changeCityName(newName: String)
}

class SearchAlert: UIView
{
    private var label = UILabel()
    private var searchTextFiled = UITextField()
    private var findButton = UIButton()
    var delegateForCityName: ChangeCityNameProtocol?
    
    private var isShowing = false
    
    init()
    {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 7
        
        self.addSubview(label)
        self.addSubview(searchTextFiled)
        self.addSubview(findButton)
        
        searchTextFiled.delegate = self
    }
    
    func showAlert(inView view: UIView)
    {
        if !isShowing
        {
            isShowing = true
            configurate(inView: view)
        }
        
        self.isHidden = false
    }
    
    func hideAlert()
    {
        self.isHidden = true
    }
    
    private func configurate(inView view: UIView)
    {
        view.addSubview(self)
        
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        self.centerInSuperview()
        
        configurateLabel()
        configurateTextField()
        configurateButton()
    }
    
    private func configurateLabel()
    {
        label.centerXToSuperview().isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "DIN Condensed", size: 20)
        label.text = "Enter the city name"
    }
    
    private func configurateButton()
    {
        findButton.centerXToSuperview().isActive = true
        findButton.topAnchor.constraint(equalTo: searchTextFiled.bottomAnchor, constant: 20).isActive = true
        
        findButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        findButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        findButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        findButton.layer.cornerRadius = 7
        findButton.setTitle("Find", for: .normal)
        findButton.titleLabel?.font = UIFont(name: "DIN Condensed", size: 20)
        
        findButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func configurateTextField()
    {
        searchTextFiled.centerXToSuperview().isActive = true
        searchTextFiled.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        
        searchTextFiled.widthAnchor.constraint(equalToConstant: 180).isActive = true
        searchTextFiled.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        searchTextFiled.layer.borderWidth = 1
        searchTextFiled.layer.cornerRadius = 5
        
        searchTextFiled.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        searchTextFiled.font = UIFont(name: "DIN Condensed", size: 20)
        searchTextFiled.textAlignment = .center
    }
    
    @objc func buttonTapped()
    {
        self.isHidden = true
        let cityName = searchTextFiled.text!.split(separator: " ").joined(separator: "%20")
        delegateForCityName?.changeCityName(newName: cityName)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchAlert: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        searchTextFiled.resignFirstResponder()
        return true
    }
}
