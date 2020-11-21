
import Firebase
import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        signup.frame = CGRect(x: 250, y: 600, width: 60, height: 40)
        label.frame = CGRect(x: 50, y: 600, width: 400, height: 40)
        image.frame = CGRect(x: 13, y: 20, width: 400, height: 300)
        usernameField.frame = CGRect(x: 50, y: 360, width: 350, height: 50)
        passwordField.frame = CGRect(x: 50, y: 430, width: 350, height: 50)
        loginButton.frame = CGRect(x: 50, y: 500, width: 350, height: 70)
        usernameField.delegate = self
        passwordField.delegate = self
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(signup)
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
    
    private let image: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "Logo")
        return image
        
    }()
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(Signup), for: .touchUpInside)
        return button
        
        
    }()
    
    private let signup: UIButton = {
        let button = UIButton()
        button.setTitle("Here", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(Signup), for: .touchUpInside)
        return button
        
        
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account. Tap           to make one"
        
        return label
        
        
    }()
    
    @objc func Signup() {
        var Register = RegisterViewController()
        Register.modalPresentationStyle = .fullScreen
        present(Register, animated: true, completion: nil)
    }
//    @objc func Login() {
//        passwordField.resignFirstResponder()
//
//        if (usernameField.text!.count) < 6 || (passwordField.text!.count) < 6 {
//
//            let alert = UIAlertController(title: "Whoops",
//                                          message: "Please enter all information to log in.",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title:"Dismiss",
//                                          style: .cancel, handler: nil))
//            present(alert, animated: true)
//
//        }
//
//        else if usernameField.text == usernames[0] && passwordField.text == passwords[0] {
//            let AfterVC = RegisterViewController()
//            AfterVC.modalPresentationStyle = .fullScreen
//            present(AfterVC, animated: true, completion: nil)
//        }
//        else if usernameField.text == usernames[1] && passwordField.text == passwords[1] {
//            let AfterVC = RegisterViewController()
//            AfterVC.modalPresentationStyle = .fullScreen
//            present(AfterVC, animated: true, completion: nil)
//        }
//        else if usernameField.text == usernames[2] && passwordField.text == passwords[2] {
//            let AfterVC = RegisterViewController()
//            AfterVC.modalPresentationStyle = .fullScreen
//            present(AfterVC, animated: true, completion: nil)
//        }
//        else {
//            let alert = UIAlertController(title: "Incorrect!",
//                                          message: "Incorrect Username or Password! Please Try Again.",
//                                          preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title:"Dismiss",
//                                          style: .cancel, handler: nil))
//            present(alert, animated: true)
//        }
//        }
//
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == usernameField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            //Login()
        }

        return true
    }
}
