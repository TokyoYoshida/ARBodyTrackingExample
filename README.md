# ARBodyTrackingExample

A very simple sample of ARBodyTracking in ARKit on iOS.

### Execution result

<img width="300px" src="https://user-images.githubusercontent.com/16970578/92990054-d2eaac00-f513-11ea-92e3-fff6bebd7dd7.jpeg">

### Code

Here is the full code.
```swift
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
```

### License

MIT
