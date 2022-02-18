import UIKit

// MARK: V0.0.1 Eklendi

@IBDesignable
open class view_desing: UIView {
    
    func setup() {
        layer.cornerRadius = 12
        //backgroundColor = Color._303030
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}

@IBDesignable //burda eklendi
open class title_view_desing: UIView {
    
    func setup() {
      
        backgroundColor = Color._F4FAFC
        layer.cornerRadius = 12
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}

@IBDesignable
open class contents_view_desing: UIView {
    
    func setup() {
      
        backgroundColor = Color._E42E2F
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}

@IBDesignable
open class button_title_desing: UIButton {
    
    func setup() {
      
        backgroundColor = Color._085EA4
        setTitle("Devamını Oku", for: .normal)
       
       // titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        clipsToBounds = true
        layer.cornerRadius = 12
        //contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 0)
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}

@IBDesignable //burda eklendi
open class button_desing: UIButton {
    
    func setup() {
      
        backgroundColor =  Color._0A6B77
        
//        setTitle("", for: .normal)
       
        layer.cornerRadius = 12
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}


@IBDesignable
open class label_desing: UILabel {
    
    func setup() {
     
        textColor = Color._FFFFFF
//        font = Font.poppins_semi_bold_16
       
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

}


@IBDesignable class BottomAlignedLabel: UILabel {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        
        guard text != nil else {
            return super.drawText(in: rect)
        }
        
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y + rect.height - height
        super.drawText(in: CGRect(x: 0, y: y, width: rect.width, height: height))
    }
}

// MARK: V0.0.3 EKLENDİ
@IBDesignable class TopAlignedLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        
        guard text != nil else {
            return super.drawText(in: rect)
        }
        
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y
        super.drawText(in: CGRect(x: 0, y: y, width: rect.width, height: height))
    }
}

