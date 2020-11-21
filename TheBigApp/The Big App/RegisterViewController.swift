
import Foundation
import UIKit
import Firebase
import FirebaseDatabase


class RegisterViewController: UIViewController {

    public var ref: DatabaseReference! =  Database.database().reference()
    
  
    var dataDictionary: [String: Any] = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        image.frame = CGRect(x: 13, y: 60, width: 400, height: 300)
        back.frame = CGRect(x: 10, y: 30, width: 100, height: 50)
        firstName.frame = CGRect(x: 20, y: 370, width: 190, height: 50)
        emailField.frame = CGRect(x: 20, y: firstName.frame.maxY+20, width: 400, height: 50)
        lastName.frame = CGRect(x: 220, y: 370, width: 190, height: 50)
        usernameField.frame = CGRect(x: 20, y: emailField.frame.maxY+20, width: 400, height: 50)
        passwordField.frame = CGRect(x: 20, y: usernameField.frame.maxY+20, width: 400, height: 50)
        loginButton.frame = CGRect(x: 20, y: passwordField.frame.maxY+20, width: 400, height: 70)
        usernameField.delegate = self
        passwordField.delegate = self
        firstName.delegate = self
        lastName.delegate = self
        emailField.delegate = self
        view.addSubview(image)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.backgroundColor = .white
        view.addSubview(loginButton)
        view.addSubview(firstName)
        view.addSubview(lastName)
        view.addSubview(emailField)
        view.addSubview(back)
       

    }
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Username Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
        
    }()
  
    private let image: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Logo")
        return image
        
    }()
    
    private let firstName: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "First Name Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
        
    }()
    
    private let lastName: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Last Name Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
        
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        return field
        
    }()
  
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password Here"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = true
        return field
        
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(Sign), for: .touchUpInside)
        return button
        
        
    }()
    
    private let back: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel!.font = UIFont(name: "ArialMT", size: 22)
        button.addTarget(self, action: #selector(Back), for: .touchUpInside)
        return button
        
        
    }()


        
    @objc func Back() {
        let Back = ViewController()
        Back.modalPresentationStyle = .fullScreen
        present(Back, animated: true, completion: nil)
    }
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Username taken please choose another one then sign in again"
        label.font = UIFont(name: "Avenir-Book" , size: 14)
        label.textAlignment = .center
        label.textColor = .red
        label.frame = CGRect(x: 20, y: 545 , width: 400, height: 50)
        return label
    }()

    @objc func Sign() {
        passwordField.resignFirstResponder()
        let ref2 = self.ref.child(self.usernameField.text!).child("3")
        ref2.observeSingleEvent(of: .value , with: {  (snapshot) in
            let val = snapshot.value
            if (self.usernameField.text! as NSObject) as? String == val as? String {
                self.label.isHidden = false
                self.view.addSubview(self.label)
                    print("same")
                
                }
            
            
                else {
   
                    self.label.isHidden = true
                    self.dataDictionary[self.usernameField.text!] = [
                        self.firstName.text, self.lastName.text, self.emailField.text, self.usernameField.text, self.passwordField.text]
                    self.ref.updateChildValues(self.dataDictionary)
                    
                        print("recorded")
                    }
           
            
            
            
        })
    }}

    extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == firstName {
            lastName.becomeFirstResponder()
        }
        else if textField == lastName {
            emailField.becomeFirstResponder()
        }
        
        else if textField == emailField {
            usernameField.becomeFirstResponder()
        }
        else if textField == usernameField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            Sign()
        }

        return true
    }
     
    }


