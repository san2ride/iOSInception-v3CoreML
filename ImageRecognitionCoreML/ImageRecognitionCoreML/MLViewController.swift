//
//  MLViewController.swift
//  ImageRecognitionCoreML
//
//  Created by Jason Sanchez on 6/25/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class MLViewController: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var inception: InceptionV1 = InceptionV1()
    
    let images = ["cat", "dog", "rat", "banana"]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if index > self.images.count - 1 {
            index = 0
        }
        
        let img = UIImage(named: images[index])
        self.pictureImageView.image = img
        
        let resizeImage = img?.resizeTo(size: CGSize(width: 224, height: 224))
        
        let buffer = resizeImage?.toBuffer()
        
        
        let prediction = try! self.inception.prediction(input: InceptionV1Input(input__0: buffer!))
        
        self.titleLabel.text = prediction.classLabel
        
        index = index + 1
    }
}
