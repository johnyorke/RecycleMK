//
//  VisionView.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI

struct VisionView : UIViewControllerRepresentable {
    typealias UIViewControllerType = VisionViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<VisionView>) -> VisionViewController {
        return VisionViewController()
    }
    
    func updateUIViewController(_ uiViewController: VisionViewController, context: UIViewControllerRepresentableContext<VisionView>) {
    }
}

#if DEBUG
struct VisionView_Previews : PreviewProvider {
    static var previews: some View {
        VisionView()
    }
}
#endif
