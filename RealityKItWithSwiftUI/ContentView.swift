//
//  ContentView.swift
//  RealityKItWithSwiftUI
//
//  Created by Ramill Ibragimov on 26.12.2020.
//

import SwiftUI
import RealityKit

struct ARViewWrapper: UIViewRepresentable {
    typealias UIViewType = ARView
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        let mesh = MeshResource.generateBox(size: 0.2)
        let material = SimpleMaterial(color: .blue, roughness: 0.5, isMetallic: true)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        let anchorEntity = AnchorEntity(plane: .horizontal)
        anchorEntity.addChild(modelEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            ARViewWrapper()
            Text("Hello AR")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
