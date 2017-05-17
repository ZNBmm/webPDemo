//
//  ViewController.swift
//  如何暂停gif
//
//  Created by mac on 2017/3/31.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import YYWebImage
class ViewController: UIViewController {

    @IBOutlet weak var localWebp: UIButton!
    @IBOutlet weak var imageView: YYAnimatedImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if YYImageWebPAvailable() { // 来检查一下 WebP 组件是否被正确安装
            print("支持")
        }else {
            print("不支持")
        }
        
        // imageView.currentAnimatedImageIndex
        imageView.addObserver(self, forKeyPath: "currentAnimatedImageIndex", options: [.new], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let newValue = change![NSKeyValueChangeKey.newKey] as! UInt
        if newValue == 0 {
            imageView.stopAnimating()
        }
        
    }
    deinit {
        removeObserver(self, forKeyPath: "currentAnimatedImageIndex")
    }
    
    @IBAction func localWebpClick(_ sender: Any) {
        let localStr = Bundle.main.path(forResource: "menghuanhunli", ofType: "webp")
        imageView.yy_imageURL = URL(fileURLWithPath: localStr!);
    }
    @IBAction func netWebpClick(_ sender: Any) {
        imageView.yy_imageURL = URL(string: "http://file4.qf.56.itc.cn/style/static/gift/m/v2/webp/menghuanhunli.webp")
    }
}

extension ViewController {

}


