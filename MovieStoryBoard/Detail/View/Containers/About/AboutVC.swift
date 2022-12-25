//
//  AboutVC.swift
//  MovieStoryBoard
//
//  Created by Oğuzhan Erdem on 22.12.2022.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    static var detailAbout: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.isEditable = false
        textView.text = AboutVC.detailAbout
    }
    


}
