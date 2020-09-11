//
//  ViewController.swift
//  ARBodyTrackingExample
//
//  Created by TokyoYoshida on 2020/09/12.
//  Copyright © 2020 TokyoMac. All rights reserved.
//

import UIKit
import RealityKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet var arView: ARView!
    
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
        sceneView.delegate = self
        sceneView.session.run(configuration)
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARBodyAnchor {
            let sphere = SCNNode(geometry: SCNSphere(radius: 1))
            node.addChildNode(sphere)
        }
    }
}
