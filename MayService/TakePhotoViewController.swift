//
//  TakePhotoViewController.swift
//  MayService
//
//  Created by TST-APP-01 on 30/1/2562 BE.
//  Copyright © 2562 Teerawut. All rights reserved.
//

import UIKit

class TakePhotoViewController: UIViewController,
        UINavigationControllerDelegate,
        UIImagePickerControllerDelegate{

    @IBOutlet weak var Camera: UIImageView!
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
 
    @IBAction func takePhoto(_ sender: UIButton) {
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        Camera.image = info[.originalImage] as? UIImage
    }
    
    
    func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func savePhoto(_ sender: UIButton) {
        
        
//        var imageData = UIImageJPEGRepresentation(Camera.image!, 0.6)
//        var compressedJPGImage = UIImage(data: imageData)
//        UIImageWriteToSavedPhotosAlbum(compressedJPGImage, nil, nil, nil)
        
      
        
//        UIImageWriteToSavedPhotosAlbum(Camera, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        UIImageWriteToSavedPhotosAlbum(Camera.image!, self.performSegue(withIdentifier: "BackPreScreen", sender: self), nil, nil)
        
//        var imageData = UIImageJPEGRepresentation(Camera.image!, 0.6)
//        var compressedJPGImage = UIImage(data: imageData!)
//        UIImageWriteToSavedPhotosAlbum(compressedJPGImage, nil, nil, nil)
    
    }
    
    
    
}
