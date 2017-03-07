//
//  ViewController.swift
//  FoodTracker
//
//  Created by Hung Nguyen on 3/6/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK:properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNamelabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
    }
    
    
    //MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNamelabel.text = textField.text
    }
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: false, completion: nil)
    }
    
    var name = "Hien"
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
//        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            photoImageView.image = selectedImage
//            dismiss(animated: true, completion: nil)
//        } else {
//            
//            fatalError("")
//        }
    }
    

    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // Hide on keyboard
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, no taken
        imagePickerController.sourceType = .photoLibrary
        
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        
        if nameTextField.text == ""{
            mealNamelabel.text = "Default"
        }
        else{
            mealNamelabel.text = nameTextField.text
        }
    }

}


