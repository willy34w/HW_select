//
//  ViewController.swift
//  HW_select
//
//  Created by effk on 2018/12/3.
//  Copyright © 2018年 effk. All rights reserved.
//

import UIKit
struct question{
    var question:String
    var option:[String]
    var answer:String
    
}
var questions:[question] = []
var count = 0
var score = 0
func set_questions(){
    questions.append(question(question:"世界上最早的銀行始建於哪個國家？", option:["義大利", "美國", "法國", "瑞士"], answer:"義大利"))
    questions.append(question(question:"有“世界花城”之稱的是哪個城市？", option:["紐約", "倫敦", "巴黎", "華盛頓"], answer:"巴黎"))
    questions.append(question(question:"世界上最深的海溝位於？", option:["大西洋", "太平洋", "北冰洋", "印度洋"], answer:"太平洋"))
    questions.append(question(question:"七大洲中面積最小的是？", option:["非洲", "大洋洲", "南極洲", "北美洲"], answer:"南極洲"))
    questions.append(question(question:"是哪國人最先製作出了牛奶巧克力？", option:["英國", "西班牙", "義大利", "瑞士"], answer:"瑞士"))
    questions.append(question(question:"冰球起源于哪個國家？", option:["英國", "美國", "加拿大", "愛爾蘭"], answer:"加拿大"))
    questions.append(question(question:"乒乓球起源于哪個國家？", option:["中國", "瑞典", "法國", "英國"], answer:"英國"))
    questions.append(question(question:"排球起源于哪個國家？", option:["日本", "英國", "荷蘭", "美國"], answer:"美國"))
    questions.append(question(question:"企鵝產卵的季節一般是？", option:["春季", "夏季", "秋季", "冬季"], answer:"秋季"))
    questions.append(question(question:"最古老的醫院是設在？", option:["學校裡", "教堂裡", "宮廷裡", "集市裡"], answer:"教堂裡"))
    questions.append(question(question:"金庸小說”俠客行“中，石破天的玄鐵令是從哪裡來的？", option:["一塊燒餅裡", "一本書中", "一口井裡", "路上撿到的"], answer:"一塊燒餅裡"))
    questions.append(question(question:"科學家把豬，牛，羊，馬一起放進有毒氯氣室中，誰活了下來？", option:["豬", "牛", "羊", "馬"], answer:"豬"))
    questions.append(question(question:"從抹香鯨中提煉出的香料是？", option:["百里香", "沉水香", "麝香", "龍涎香"], answer:"龍涎香"))
    questions.append(question(question:"”變臉“是哪種劇的絕活？", option:["京劇", "豫劇", "粵劇", "川劇"], answer:"川劇"))
    questions.append(question(question:"美國微軟公司的總部設在？", option:["美國西部", "美國東部", "美國南部", "美國北部"], answer:"美國西部"))
    questions.append(question(question:"汽車在什麼狀態下排放的一氧化碳最多？", option:["高速行駛", "低速行駛", "怠速", "啟動時"], answer:"啟動時"))
    questions.append(question(question:"避雷針的發明者是誰？", option:["富蘭克林", "愛迪生", "伏打", "莫爾斯"], answer:"富蘭克林"))
    questions.append(question(question:"赤壁之戰中，假裝投降以接近曹軍的吳國將領是誰？", option:["黃忠", "黃巢", "黃蓋", "姜維"], answer:"黃蓋"))
    questions.append(question(question:"金庸封筆於幾年？", option:["1970", "1971", "1972", "1973"], answer:"1972"))
    questions.append(question(question:"魚露是什麼味道？", option:["鹹的", "甜的", "酸的", "苦的"], answer:"鹹的"))
    
}

class ViewController: UIViewController {

    @IBOutlet weak var questionNum: UILabel!
    @IBOutlet weak var QA: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var Score: UILabel!
    
    func set_question(){
        questionNum.text = "第" + String(count + 1) + "題"
        QA.text = questions[count].question
        questions[count].option.shuffle()
        button1.setTitle(questions[count].option[0], for:UIControl.State.normal)
        button2.setTitle(questions[count].option[1], for:UIControl.State.normal)
        button3.setTitle(questions[count].option[2], for:UIControl.State.normal)
        button4.setTitle(questions[count].option[3], for:UIControl.State.normal)
        Score.text = String(score)
        
    }
    @IBAction func buttonAction1(_ sender: Any) {
        if questions[count].option[0] == questions[count].answer{
            score += 10
        }
        count += 1
        if count == 10{
            warning()
        }
        else{
            set_question()
        }
    }
    @IBAction func buttonAction2(_ sender: Any) {
        if questions[count].option[1] == questions[count].answer{
            score += 10
        }
        count += 1
        if count == 10{
            warning()
        }
        else{
            set_question()
        }
    }
    @IBAction func buttonAction3(_ sender: Any) {
        if questions[count].option[2] == questions[count].answer{
            score += 10
        }
        count += 1
        if count == 10{
            warning()
        }
        else{
            set_question()
        }
    }
    @IBAction func buttonAction4(_ sender: Any) {
        if questions[count].option[3] == questions[count].answer{
            score += 10
        }
        count += 1
        if count == 10{
            warning()
        }
        else{
            set_question()
        }
    }
    
    func restart(){
        count = 0
        score = 0
        questions.shuffle()
        set_question()
    }
    
    func warning () {
        let alert =  UIAlertController(title: "game over!", message: "\(score)分", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.restart()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_questions()
        questions.shuffle()
        set_question()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

