# Text Field in SwiftUI

    Text fields are a fundamental component of user interfaces, allowing users to input text. In SwiftUI, you can create text fields using the `TextField` view. Below is a guide on how to use text fields in SwiftUI, including customization options and best practices.

## Creating a Basic Text Field

![TextFieldFields](TextFieldFields.png)

```swift
import SwiftUI

class WelcomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate to self
        // This allows the view controller to respond to text field events
        textField.delegate = self
    }

    // MARK: - UITextFieldDelegate Methods
    // This method is called when the user begins editing the text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard when the return key is pressed
        textField.resignFirstResponder()

        // Close the keyboard
        textField.endEditing(true)
        // Return true to indicate that the text field should process the return key
        return true
    }

    // FOR checking the text field value
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            // Perform any actions you need when the text field ends editing
            print("Text field value: \(textField.text ?? "")")

            return true // Allow the text field to end editing
        } else {
            // Show an alert if the text field is empty
            let alert = UIAlertController(title: "Error", message: "Please enter a value.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            return false // Prevent the text field from ending editing
        }

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // This method is called when the user finishes editing the text field
        // You can perform any actions you need here, such as saving the input
        print("Text field value: \(textField.text ?? "")")
        textField.text = "" // Clear the text field after editing
    }
}
```
