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
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var infoTextView: UITextView!
    
    var sight: Sight?
    
    //MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender{
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            sight = Sight(name: name, photo: photo, rating: rating)
        }
    }
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddingSightMode = presentingViewController is UINavigationController
        
        if isPresentingInAddingSightMode{
            dismissViewControllerAnimated(true, completion: nil)
            print("dismissViewControllerAnimated")
        }else{
            navigationController!.popViewControllerAnimated(true)
            print("popViewControllerAnimated")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        
        //Set up views if editing the exisiting
        if let sight = sight{
            navigationItem.title = sight.name
            nameTextField.text = sight.name
            photoImageView.image = sight.photo
            ratingControl.rating = sight.rating
        }
        
        checkValidSightName()
        loadSightInfo()
    }
    
    func loadSightInfo(){
        //TODO: Remove space in the end and spaces in center;
        //TODO: Add parsing of dataString;
        var dataString: String
        let sightName = self.nameTextField.text! 
        let myURLString = "https://en.wikipedia.org/w/api.php?action=query&titles=" + sightName + "&prop=revisions&rvprop=content&format=json"
        print("myURLString " + myURLString)
        if let myURL = NSURL(string: myURLString) {
            do {
                let dataString = try! NSString(contentsOfURL: myURL, encoding: NSUTF8StringEncoding)
                print(dataString)
                infoTextView.text = dataString as String
            } catch {
                print("Error of resolve!")
            }
        } else {
            print("Error of URL")
        }
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
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkValidSightName(){
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidSightName()
        navigationItem.title = textField.text
    }

    // Mark: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder() //hide the keyboard
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary //тут можно выбрать камеру или фотобиблиотеку
        imagePickerController.delegate = self //make sure ViewController is notified when the user picks an image
        presentViewController(imagePickerController, animated: true, completion: nil) //called by ViewController; Asks ViewController to present the view controller defined by imagePickerController
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

