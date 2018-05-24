//
//  ViewController.swift
//  Tamago_1
//
//  Created by JunsangYu on 24/05/2018.
//  Copyright © 2018 test-web-server. All rights reserved.
//

import UIKit

let viewModel = View()

class ViewController: UIViewController {
    
    var count = 0
    
    var imgView: UIImageView = UIImageView()
    var lblView: UILabel = UILabel()
    var btnView: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI() {
        let viewHeight = self.view.frame.height
        let viewWidth = self.view.frame.width
        
        lblView = viewModel.lbl(x: 0, y: viewHeight * 0.05, width: viewWidth, height: viewHeight * 0.1, text: "0")
        imgView = viewModel.img(x: 0, y: viewHeight * 0.3, width: viewWidth, height: viewHeight * 0.5, img: #imageLiteral(resourceName: "egg_start"))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedImg))
        imgView.addGestureRecognizer(tapGestureRecognizer)
        imgView.isUserInteractionEnabled = true
        
        view.addSubview(imgView)
        view.addSubview(lblView)
    }
    @objc func reset() {
        self.count = 0
        self.lblView.text = String(self.count)
        self.imgView.image = #imageLiteral(resourceName: "egg_start")
    }
    @objc func tappedImg() {
        count += 1;
        if (count >= 100) {
            imgView.image = #imageLiteral(resourceName: "egg_real end")
            lblView.text = "성공!"
            let alertController = UIAlertController(title: "부화!", message: "삐앾", preferredStyle: .alert)
            let alertActionRetry = UIAlertAction(title: "다시하기", style: .default, handler: { (alert: UIAlertAction!) in
                self.reset()
            })
            let alertActionConfirm = UIAlertAction(title: "확인", style: .default, handler: { (alert: UIAlertAction!) in
                self.btnView = viewModel.btn(x: self.view.center.x - 75.0, y: self.view.frame.height - 50.0, width: 150.0, height: 30.0, text: "다시하기")
                self.btnView.addTarget(self, action: #selector(self.reset), for: .touchUpInside)
                self.view.addSubview(self.btnView)
            })
            alertController.addAction(alertActionRetry)
            alertController.addAction(alertActionConfirm)
            present(alertController, animated: true, completion: nil)
        }
        else {
            lblView.text = String(count)
            switch count {
            case 1..<20:
                imgView.image = #imageLiteral(resourceName: "egg_start")
                break
            case 20..<40:
                imgView.image = #imageLiteral(resourceName: "egg_little")
                break
            case 40..<60:
                imgView.image = #imageLiteral(resourceName: "egg_many")
                break
            case 60..<80:
                imgView.image = #imageLiteral(resourceName: "egg_end")
                break
            case 80..<100:
                imgView.image = #imageLiteral(resourceName: "egg_soon end")
                break
            default:
                break
            }
        }
        
    }

}

