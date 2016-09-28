//
//  HookerView.swift
//  CauCa
//
//  Created by Admin on 9/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit
class HookerView: UIImageView {
    
    let PREPARE = 0  // bat dau keo keo
    let DROPPING = 1  // dang keo xuong
    let DRAWINGUP = 2  // dang keo len
    let CAUGHTF = 3   // bat duoc con ca
    var status: Int?  // luu trang thai con ca
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named:"hook")
        self.status = PREPARE
        print("goi ham init hooker")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
        
    }
    func updateMove(){
        if(self.status == DROPPING){
            self.center = CGPointMake(self.center.x, self.center.y + 10)
            if(self.frame.origin.y + self.frame.height > 480){
                self.status = DRAWINGUP
            }
        }else if(self.status == DRAWINGUP){
            self.center = CGPointMake(self.center.x, self.center.y - 20)
            if(self.frame.origin.y + self.frame.size.height < 0){
                self.status = PREPARE
            }
        }else if(self.status == CAUGHTF){
            self.center = CGPointMake(self.center.x, self.center.y - 5)
            if(self.frame.origin.y + self.frame.height < 0){
                self.status = PREPARE
            }
        }
    }
    func dropDownAtX(x: Int){
        if(self.status == PREPARE){
            self.center = CGPointMake(CGFloat(x), self.center.y)
            self.status = DROPPING
        }
    }
}
