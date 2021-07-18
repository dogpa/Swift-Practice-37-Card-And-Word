//
//  ViewController.swift
//  Swift Practice #37 Card And Word
//
//  Created by CHEN PEIHAO on 2021/7/18.
//

import UIKit

class ViewController: UIViewController {
    
    //ImageView
    @IBOutlet weak var CardAreaImageView: UIImageView!
    
    //兩個TextField
    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var contentWordTextField: UITextField!
    
    //兩條slider
    @IBOutlet weak var titleSizeSlider: UISlider!
    @IBOutlet weak var contentWordSizeSlider: UISlider!
    
    //兩個字數
    @IBOutlet weak var titleNumberLabel: UILabel!
    @IBOutlet weak var contentWordNumberLabel: UILabel!
    
    //兩個字體大小
    @IBOutlet weak var titleSizeLabel: UILabel!
    @IBOutlet weak var contentWordSizeLabel: UILabel!
    
    //兩個imageView內的Label
    @IBOutlet weak var imageTitleLabel: UILabel!
    @IBOutlet weak var imageContentWordLabel: UILabel!
    
    //改變節慶的segmentedcontroller
    @IBOutlet weak var festivalChangeSegmentedController: UISegmentedControl!
    
    //字色的segmentedcontroller
    @IBOutlet weak var fontColorSegmentController: UISegmentedControl!
    
    //預設文字
    var noteText = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //點螢幕收鍵盤

    
    //標題title與輸入內容的IBaction
    //標題Action
    @IBAction func titleInput(_ sender: UITextField) {
        //定義titleWordNUmber為標題內的textfiled字數和
        let titleWordNUmber = TitleTextField.text?.count
        //將titleNumberLabel的顯示內容指派為標題的textfield的字數和
        titleNumberLabel.text = "\(titleWordNUmber!)"
        //收鍵盤
        noteText = "\(sender.text!)"
    }
    
    //內容文字字數的action
    @IBAction func contentWordInput(_ sender: UITextField) {
        //定義contentWordNumber內容為textField的字數和
        let contentWordNumber = contentWordTextField.text?.count
        //字數label顯示textfield內的字數和(contentWordNumber)
        contentWordNumberLabel.text = "\(contentWordNumber!)"
        //收鍵盤
        noteText = "\(sender.text!)"
    }
    
    
    
    //兩條slider與slider右側的label連動
    //title的slider與label
    @IBAction func titleWordSizeChange(_ sender: UISlider) {
        //定義titleWordSize 內容為這條slider自身的value
        let titleWordSize = sender.value
        //numberString內容為確定格式為float的小數點兩位數並且順便將顯示內容帶入slider本身的值
        let numberString = String(format: "%.2f", titleWordSize)
        //下方imageView內的標題title的字體大小隨著slider本身的值改變，withsize內因爲cgfloat所以必須透過cgfloat協助將float轉型
        imageTitleLabel.font = imageTitleLabel.font?.withSize(CGFloat(titleWordSize))
        //slider右側的label顯示內容則為左側slider的值
        titleSizeLabel.text = "\(numberString)"
    }
    
    //contentWord的slider與label
    @IBAction func contentWordSizeChange(_ sender: UISlider) {
        //定義contendWordSize將其內容指派為這條slider自身的值
        let contendWordSize = sender.value
        //定義contendWordString將內容指派為string,顯示格式透過format協助顯示為小數點兩位數,顯示內容為剛剛定義好的contendWordSize的值
        let contendWordString = String(format: "%.2f", contendWordSize)
        //imageView內contentWord內的字體的大小，透過slider內的值改變跟著改變,一樣要將slider的float改變轉型為cgfloat
        imageContentWordLabel.font = imageContentWordLabel.font?.withSize(CGFloat(contendWordSize))
        //將slider右側的label的顯示內容改為slider的值
        contentWordSizeLabel.text = "\(contendWordString)"
    }
    
    
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    
    
    //顯示輸入內容的button的Action
    @IBAction func changedApply(_ sender: UIButton) {
        //將imageView內的文字改變成為在textfield內輸入的文字
        imageTitleLabel.text = TitleTextField.text
        imageContentWordLabel.text = contentWordTextField.text
    }
    
    //定義一個 restWord()的function用於重設的button使用
    //內容將圖片改為新年顯示內容改為預設的文字
    func restWord() {
        CardAreaImageView.image = UIImage(named: "chinese")
        imageTitleLabel.text = "新年快樂"
        imageContentWordLabel.text = "新年好運到，誠摯祝福萬事如意 平安喜樂"
        festivalChangeSegmentedController.selectedSegmentIndex = 0
        TitleTextField.text = ""
        contentWordTextField.text = ""
        let titleWordNUmber = TitleTextField.text?.count
        titleNumberLabel.text = "\(titleWordNUmber!)"
        let contentWordNumber = contentWordTextField.text?.count
        contentWordNumberLabel.text = "\(contentWordNumber!)"

    }
    
    
    //重設的button的IBaction內容,執行剛剛設定好的restWord函式
    @IBAction func buttonReset(_ sender: UIButton) {
        restWord()
    }
    
    
    //定義節慶segmented controller點選後會改變圖片並顯示預設文字
    @IBAction func festivalChange(_ sender: UISegmentedControl) {
        
        //判斷segmented controller的值
        if  festivalChangeSegmentedController.selectedSegmentIndex == 0 {
            //若為0圖片改變為新年
            CardAreaImageView.image = UIImage(named: "chinese")
            //將title與contentWord的內容改為下面的預設的值
            imageTitleLabel.text = "新年快樂"
            imageContentWordLabel.text = "新年好運到，誠摯祝福萬事如意 平安喜樂"
        }else if festivalChangeSegmentedController.selectedSegmentIndex == 1{
            CardAreaImageView.image = UIImage(named: "Valentine")
            imageTitleLabel.text = "相愛一生"
            imageContentWordLabel.text = "世界七十億分之一的相遇，終於有情人終成眷屬"
        }else{
            CardAreaImageView.image = UIImage(named: "merry")
            imageTitleLabel.text = "聖誕快樂"
            imageContentWordLabel.text = "在這一天，期待聖誕老人的來臨"
        }
    }
    

    @IBAction func fontColorChange(_ sender: UISegmentedControl) {
        if fontColorSegmentController.selectedSegmentIndex == 0{
            imageTitleLabel.textColor = UIColor.black
            imageContentWordLabel.textColor = UIColor.black
        }else if fontColorSegmentController.selectedSegmentIndex == 1{
            imageTitleLabel.textColor = UIColor.red
            imageContentWordLabel.textColor = UIColor.red
        }else{
            imageTitleLabel.textColor = UIColor.blue
            imageContentWordLabel.textColor = UIColor.blue
        }
    }
    
    
    
    

}

