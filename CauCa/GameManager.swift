//
//  GameManager.swift
//  CauCa
//
//  Created by Admin on 9/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class GameManager: NSObject{
    
    var fishVies: NSMutableArray?
    var hookView : HookerView?
    var fishCatch : FishView?
    var motlan : Int = 0
    
    override init() {
        self.fishVies = NSMutableArray()
        self.hookView = HookerView(frame: CGRectMake(0, -490, 20, 490))
        
        
    }
    
    
    
    func addFishToviewController(viewcontroller: UIViewController, width: Int){

        let fishView = FishView(frame: CGRectMake(0, 0, 40, 30))
        
        fishView.generateFish(width)
        self.fishVies?.addObject(fishView)
        viewcontroller.view.addSubview(fishView) 
    }
    func bite(fishView: FishView){
        if(fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWINGUP){
            fishView.caught()

            fishView.center = CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTF
        }
    }
    func updateMove(){
        
        
        

        self.hookView?.updateMove()
        if(fishCatch != nil && (fishCatch?.kiemtra_y())! == true ){
            fishCatch = nil
            motlan = 0
            print("het ca cu")
        }
      
        for fishView in self.fishVies!
        {
            fishView.updateMove()
            if(CGRectContainsPoint(fishView.frame, CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2))){
                motlan += 1;

                if( motlan == 1){
                    fishCatch = fishView as! FishView
                    bite(fishView as! FishView)
                    
                }
            
            }
        }
    }
    func dropHookerAtX(x: Int){
        self.hookView?.dropDownAtX(x)
    }
}
