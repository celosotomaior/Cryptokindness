//
//  ViewController.swift
//  eGovernment
//
//  Created by Marcelo on 02/03/2019.
//  Copyright © 2019 Marcelo. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func btnClick(_ sender: UIButton) {
        
        let createGenesis = Blockchain.init()
        print(createGenesis)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        submitButton.isHidden = true
        checkPermission()
      
       
        imageView.isUserInteractionEnabled = true
    }
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    

    
    @IBAction func selectImage(_ sender: UIButton) {
    let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller,animated: true, completion: nil)
       
    }
    
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//
//       imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//
//        self.dismiss(animated: true, completion: nil)
//        }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
//            PHPhotoLibrary.requestAuthorization { [weak self](_) in
//                // Present the UIImagePickerController
//                self?.present(picker, animated: true, completion: nil)
//            }
//        }
//        var selectedImage: UIImage?
//        if let editedImage = info[.editedImage] as? UIImage {
//            selectedImage = editedImage
//            self.imageView.image = selectedImage!
//            picker.dismiss(animated: true, completion: nil)
//        } else if let originalImage = info[.originalImage] as? UIImage {
//            selectedImage = originalImage
//            self.imageView.image = selectedImage!
//            picker.dismiss(animated: true, completion: nil)
//        }
//        let coordinate = (info[UIImagePickerController.InfoKey.phAsset] as? PHAsset)?.location?.coordinate
//         print (coordinate as Any)
//
//    }
    
  @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = pickedImage
        }
        let coordinate = (info[UIImagePickerController.InfoKey.phAsset] as? PHAsset)?.location?.coordinate
//        let latitude = coordinate?.latitude
        print(coordinate?.latitude ?? "No latitude found")
//        let longitude = coordinate?.longitude
        print(coordinate?.longitude ?? "No longitude found")
    submitButton.isHidden = false
        
        self.dismiss(animated: true, completion: nil)
    }
        
//    }
    
   
    
//    @IBAction func upload(_ sender: Any) {
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
//        picker.allowsEditing = false
//        self.present(picker, animated: true) {
//
//        }
//
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//
//            imageView.image = originalImage
//            if let imgData = UIImageJPEGRepresentation(originalImage, 0.2) {
//                let parameters = ["user":"Sol", "password":"secret1234"]
//                upload(params: parameters, imageData: imgData)
//            }
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    func upload(params : [String: Any], imageData: Data) {
//
//        if let url = URL(string: "EnterUrl") {
//            Alamofire.upload(
//                multipartFormData: { (multipartdata) in
//
//                    multipartdata.append(
//                        imageData,
//                        withName: "fileset",
//                        fileName: String("\(Date().timeIntervalSince1970).jpg"),
//                        mimeType: "image/jpg"
//                    )
//
//                    for (key,value) in params {
//                        if let data = value as? String,
//                            let data1 = data.data(using: .utf8)
//                        {
//                            multipartdata.append(
//                                data1,
//                                withName: key
//                            )
//                        }
//                    }
//            },
//                to: url,
//                method: .post,
//                headers: nil,
//                encodingCompletion: { (result) in
//                    switch result {
//                    case .success(let upload, _, _):
//                        upload.responseJSON(completionHandler: { (response) in
//                            if let err = response.error {
//                                print(err.localizedDescription)
//                            } else {
//                                print(response.result.value ?? "No data")
//
//                            }
//                        })
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    }
//            }
//            )
//        }
//
//    }
//}


}

