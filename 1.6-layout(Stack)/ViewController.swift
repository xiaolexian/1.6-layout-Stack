//
//  ViewController.swift
//  1.6-layout(Stack)
//
//  Created by liudeng on 16/3/8.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grapeStack: UIStackView!    // 葡萄栈
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    MARK:- 添加葡萄点击事件
    @IBAction func addGrape(sender: AnyObject) {
        
        // 0.实例化一个葡萄对象
        let grapeImage = UIImageView(image: UIImage(named: "grape"))
        
        // 1.更改图像的内容显示模式(.ScaleAspectFit是保持图片内容的纵横比例，来适应视图的大小)
        grapeImage.contentMode = .ScaleAspectFit
        
        // 2.进行添加到栈里面
        grapeStack.addArrangedSubview(grapeImage)
        
        // 3.利用layouIfNeeded来添加动画
        UIView.animateWithDuration(0.25, animations: {
            self.grapeStack.layoutIfNeeded()
        })

    }
    //    MARK:- 移除葡萄点击事件
    @IBAction func removeGrape(sender: AnyObject) {
        
        // 0. 获取葡萄栈中最后一个图片控件
        let grapeImageLast = grapeStack.arrangedSubviews.last
        
        // 1. 判断是否有这个图片如果有执行下面代码
        if (grapeImageLast != nil){
            
            // 1.1从栈中移除只是从葡萄栈中拿出来,并没有真正的消除
            grapeStack.removeArrangedSubview(grapeImageLast!)
            
            // 1.2 移除图像本身
            grapeImageLast!.removeFromSuperview()
            
            // 1.3.利用layouIfNeeded来添加动画
            UIView.animateWithDuration(0.25, animations: {
                self.grapeStack.layoutIfNeeded()
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

