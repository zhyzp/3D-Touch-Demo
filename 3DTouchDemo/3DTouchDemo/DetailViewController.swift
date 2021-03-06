//
//  DetailViewController.swift
//  3DTouchDemo
//
//  Created by user on 2017/3/22.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var is3DTouchAvailable: Bool {
        return self.traitCollection.forceTouchCapability == .available
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        let action1 = UIPreviewAction(title: "Action One",
                            style: .default,
                            handler: { previewAction, viewController in
                                    print("Action One Selected")
                            })

        let action2 = UIPreviewAction(title: "Action Two",
                            style: .selected,
                            handler: { previewAction, viewController in
                                    print("Action Two Selected")
                            })

        let groupAction1 = UIPreviewAction(title: "Group Action One",
                              style: .default,
                              handler: { previewAction, viewController in
                                    print("Group Action One Selected")
                              })

        let groupAction2 = UIPreviewAction(title: "Group Action Two",
                              style: .default,
                              handler: { previewAction, viewController in
                                    print("Group Action Two Selected")
                              })

        let groupActions = UIPreviewActionGroup(title: "My Action Group...",
                                    style: .default,
                                    actions: [groupAction1, groupAction2])

        return [action1, action2, groupActions]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if is3DTouchAvailable == false {
            return
        }
        let touch = touches.first
        view.backgroundColor = UIColor(red: 0.8, green: 0.5, blue: ((touch?.force)!/(touch?.maximumPossibleForce)!), alpha: 1.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
