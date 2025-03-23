//
//  RickAndMortyViewController.swift
//  Rick-and-Morty-API-Learn
//
//  Created by Mehmet Tuna Arıkaya on 23.03.2025.
//

import UIKit
import SnapKit

final class RickAndMortyViewController: UIViewController {
    //final ile performans artişi viewcontroller genelde miras almaz birbirinden
    protocol RickyMortyOutPut {
        func changeLoading(isLoad: Bool)
        func saveDatas(values: [Result])
    }
    
    private let labelTitle : UILabel = UILabel()
    private let box : UIView = UIView()
    private let indicatior : UIActivityIndicatorView = UIActivityIndicatorView()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        drawDesign()

        // Do any additional setup after loading the view.
    }
    private func drawDesign(){
        DispatchQueue.main.async{
            self.labelTitle.text  = "tutuu"
            self.indicatior.color = .blue
            self.box.backgroundColor = .red
        }
        indicatior.startAnimating()
    }

    private func configure(){
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicatior)
        drawDesign()
        makeBox()
        makeLabel()
        makeIndicator()
    }

}
extension RickyMortyViewController: RickyMortyOutPut {
    func changeLoading(isLoad: Bool) {
        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
    }

    func saveDatas(values: [Result]) {
       //table view yapmada kaldım devam edecem 44.42
    }
}

extension RickAndMortyViewController {
    private func makeBox(){
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.left.equalTo(view).offset(10) // Sol boşluk 10 br
            make.right.equalTo(view).offset(-10) // Sağ boşluk 10 br
            make.bottom.equalToSuperview()
            
        }
    }
        func makeLabel(){
            labelTitle.snp.makeConstraints{
                (make) in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
                make.left.equalTo(view).offset(10)
                make.right.equalTo(view).offset(-10)
                
                make.height.equalTo(10)
                
            }
            
        }
        func makeIndicator(){
            indicatior.snp.makeConstraints{ (make) in
                make.height.equalTo(labelTitle)
                make.right.equalTo(labelTitle).offset(-5)
                make.top.equalTo(labelTitle)
                
                
            }
            
            
        }
    }

