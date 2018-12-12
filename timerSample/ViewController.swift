//
//  ViewController.swift
//  timerSample
//
//  Created by 佐藤一成 on 2018/12/12.
//  Copyright © 2018 佐藤一成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count:Int = 0
    let imageArray:[UIImage] =
        [UIImage(named: "a.jpg")!,
         UIImage(named: "b.jpg")!,
         UIImage(named: "c.jpg")!,
         UIImage(named: "d.jpg")!,
         UIImage(named: "e.jpg")!,
         UIImage(named: "f.jpg")!,]
    
    let imageView = UIImageView()
    let button = UIButton(type: UIButton.ButtonType.system)
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = self.view.frame
        imageView.contentMode = .scaleAspectFill
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        selectImage(n: count)
        makeButton()
    }
    func selectImage(n:Int){
        imageView.image = imageArray[n]
    }
    func makeButton(){
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: UIControl.Event.touchUpInside)// ボタンを押した時に実行するメソッドを指定
        button.setTitle("ボタン", for: UIControl.State.normal)// ラベルを設定する
        button.sizeToFit()// サイズを決める(自動調整)
        button.center = self.view.center// 位置を決める(画面中央)
        self.view.addSubview(button)// viewに追加する
    }
    @objc func buttonEvent(_ sender: UIButton) {
        count += 1
        if count >= imageArray.count{
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "timerVC")
            nextVC?.modalTransitionStyle = .partialCurl
            present(nextVC!,animated: true,completion: nil)
        }else{
            selectImage(n: count)
        }
    }
    
}

