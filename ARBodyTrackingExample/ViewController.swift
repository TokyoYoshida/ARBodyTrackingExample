//
//  ViewController.swift
//  ARBodyTrackingExample
//
//  Created by TokyoYoshida on 2020/09/12.
//  Copyright © 2020 TokyoMac. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initARKit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startARKit()
    }

    fileprivate func initARKit() {
        sceneView.delegate = self
    }

    fileprivate func startARKit() {
        let configuration = ARBodyTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARBodyAnchor {
            let geometory = SCNSphere(radius: 1)
            geometory.firstMaterial?.diffuse.contents = UIColor.init(red: 175/255, green: 255/255, blue: 255/255, alpha: 200/255)
            let sphere = SCNNode(geometry: geometory)
            
            node.addChildNode(sphere)
        }
    }
}
