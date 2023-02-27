//
//  AnimViewController.swift
//  testAnim1
//
//  Created by Alok Rathaur on 27/02/23.
//

import UIKit

class AnimViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let jeremyGif = UIImage.gifImageWithName("funny")
//        let imageView = UIImageView(image: jeremyGif)
//        imageView.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
//        view.addSubview(imageView)
        
        let jeremyGif = UIImage.gifImageWithName("youSaved")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 20.0, y: 50.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView)
        
        
        /************************ Load GIF image Using Data ********************/
        
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "play", withExtension: "gif")!)
        let advTimeGif = UIImage.gifImageWithData(imageData!)
        let imageView2 = UIImageView(image: advTimeGif)
        imageView2.frame = CGRect(x: 20.0, y: 220.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView2)
        
        /************************ Load GIF image URL **************************/
        
        let gifURL : String = "http://www.gifbin.com/bin/4802swswsw04.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 390.0, width: self.view.frame.size.width - 40, height: 150.0)
        view.addSubview(imageView3)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
