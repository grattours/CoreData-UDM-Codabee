//
//  AppDelegate.swift
//  Codata
//
//  Created by Luc Derosne on 28/11/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//


import UIKit

class AddArticleController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var shopTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    
    @IBOutlet weak var bottomScroll: NSLayoutConstraint!
    
    
    var liste: Liste!
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
        NotificationCenter.default.addObserver(self, selector: #selector(hideKey), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showKey), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func tapView() {
        view.endEditing(true)
    }
    
    @objc func hideKey(notification: Notification) {
        UIView.animate(withDuration: 0.35) {
            self.bottomScroll.constant = 0

        }
    }
    
    @objc func showKey(notification: Notification) {
        if let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            UIView.animate(withDuration: 0.35) {
                self.bottomScroll.constant = -height
            }
        }
    }
    
    @IBAction func addArticleAction(_ sender: Any) {
        view.endEditing(true)
        CoreDataHelper().saveArticle(name: nameTF.text, shop: shopTF.text, prix: priceTF.text, image: imageView.image, liste: liste)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func camera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func pictureGallery(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
}



extension AddArticleController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let or = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.imageView.image = or
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
