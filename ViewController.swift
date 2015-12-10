//
//  ViewController.swift
//  SightsTracker
//
//  Created by Admin on 01.12.15.
//  Copyright © 2015 ru.b00blik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sightNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the keybrd
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        sightNameLabel.text = textField.text
    }

    // Mark: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder() //hide the keyboard
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary //тут можно выбрать камеру или фотобиблиотеку
        imagePickerController.delegate = self //make sure ViewController is notified when the user picks an image
        presentViewController(imagePickerController, animated: true, completion: nil) //called by ViewController; Asks ViewController to present the view controller defined by imagePickerController
    }
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        sightNameLabel.text = "Default Text"
    }
    
    //Mark: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    


}

