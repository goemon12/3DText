//
//  GameViewController.swift
//  3DText
//
//  Created by goemon12 on 2019/08/16.
//  Copyright © 2019 goemon12. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    var cnt: Int = 0
    var txt: SCNText!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/3DText.scn")!
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        txt = scene.rootNode.childNode(withName: "TEXT", recursively: true)?.geometry as? SCNText
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.txt.string = "\(self.cnt)"
            self.cnt = (self.cnt + 1) % 100
        })
    }
        
}
