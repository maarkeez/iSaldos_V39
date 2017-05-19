//
//  SAGaleriaImagenesViewController.swift
//  iSaldos
//
//  Created by formador on 12/5/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class SAGaleriaImagenesViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myScrollViewGaleria: UIScrollView!
    @IBOutlet weak var myPageControllerGaleria: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anchoImagen = self.view.frame.size.width
        let altoImagen = self.view.frame.height
        
        for c_imagen in 0..<8{
            let imagenes = UIImageView(image: UIImage(named: String(format: "FOTO_%d.jpg", c_imagen)))
            imagenes.frame = CGRect(x: CGFloat(c_imagen) * anchoImagen,
                                    y: 0,
                                    width: anchoImagen,
                                    height: altoImagen)
            myScrollViewGaleria.addSubview(imagenes)
        }
        
        myScrollViewGaleria.delegate = self
        myScrollViewGaleria.contentSize = CGSize(width: 7 * anchoImagen, height: altoImagen)
        myScrollViewGaleria.isPagingEnabled = true
        myPageControllerGaleria.numberOfPages = 7
        myPageControllerGaleria.currentPage = 0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}//FIN DE LA CLASE

extension SAGaleriaImagenesViewController : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = myScrollViewGaleria.contentOffset.x / myScrollViewGaleria.frame.width
        myPageControllerGaleria.currentPage = Int(page)
    }
    
}
















