//
//  HeaderView.swift
//  Rapptr iOS Test
//
//  Created by Louis Harris on 3/20/22.
//

import UIKit

@IBDesignable
class HeaderView: UIView{
    var view: UIView!
    
    //MARK: Outlets
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK: Lifecycle
    func loadViewFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "HeaderView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        addSubview(view)
        
        btnLeft.setTitle("", for: .normal)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    //MARK: IBDesignable
    
    @IBInspectable var setTitle: String = ""{
        didSet{
            lblTitle.text = setTitle
        }
    }
    
    @IBInspectable var hideLeftBtn: Bool = true{
        didSet{
            btnLeft.isHidden = hideLeftBtn
        }
    }
    
    // MARK: - IBACtion
    
    @IBAction func backBtnPressed(_ sender: Any) {
        window?.rootViewController?.navigationController?.dismiss(animated: true)
    }
    
    
}
