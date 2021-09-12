//
//  HomeViewController.swift
//  BangUl
//
//  Created by Hyeji on 2021/09/12.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imgViewTop: UIImageView!
    @IBOutlet weak var lblNickName: UILabel!
    @IBOutlet weak var imgViewLogo: UIImageView!
    @IBOutlet weak var lblPay: UILabel!
    @IBOutlet weak var btnConnect: UIButton!
    @IBOutlet weak var lblStoreName: UILabel!
    
    var connectState: Bool = false
    var getData: Int = 0
    var startTime: String = ""
    var currentTime: String = ""
    let interval = 1.0 // 1초
    let timeSelector: Selector = #selector(HomeViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        initSetting()
    }
    
    func initSetting() { // design 관련 초기 세팅
        btnConnect.layer.cornerRadius = 15
        imgViewTop.setGradient(color1: .systemBlue, color2: .white)
    }

    @IBAction func btnConnect(_ sender: UIButton) { // 사용자가 연결하기 혹은 연결종료하기 버튼 눌렀을 경우

        switch connectState {
        case false:  // 카페와 연결되지 않은 경우
            switch choiceCafe {
            case false:
                let resultAlert = UIAlertController(title: "이용할 매장을 선택해 주세요!", message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    self.performSegue(withIdentifier: "sgStoreChoice", sender: self)
                })
                resultAlert.addAction(cancelAction)
                resultAlert.addAction(okAction)
                present(resultAlert, animated: true, completion: nil)
            default: // 이용할 매장 선택 완료된 상태 + 연결하기 버튼 누른 상태 (연결 시작)
                // getData 함수 만들고 그 안에 switch 문 넣기 (***수정필요***)
                // getData 함수 Indicator 돌게 만들기 (***수정필요***)
                switch getData {
                case 1:
                    // 시작 시간 start
                    let date = NSDate()
                    let formatter = DateFormatter()
                    formatter.locale = Locale(identifier: "ko")
                    formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
                    startTime = formatter.string(from: date as Date)
                    print(startTime)
                    
                default:
                    let resultAlert = UIAlertController(title: "사람이 감지되지 않았습니다.\n의자에 다시 착석해주세요!", message: nil, preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                        // getData 다시 호출하기 (***수정필요***)
                    })
                    resultAlert.addAction(cancelAction)
                    resultAlert.addAction(okAction)
                    present(resultAlert, animated: true, completion: nil)
                }
            }
        default:  // 카페와 연결된 경우
            let resultAlert = UIAlertController(title: "이용을 종료하시겠습니까?", message: nil, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.connectState = false
                choiceCafe = false
                self.btnConnect.setTitle("연결하기", for: .normal)
            })
            resultAlert.addAction(cancelAction)
            resultAlert.addAction(okAction)
            present(resultAlert, animated: true, completion: nil)
        }
        
    }
    
    @objc func updateTime(){

        let date = NSDate()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        currentTime = formatter.string(from: date as Date)
        print(currentTime)
        
        // 시작 시간과 현재 시간 비교 (이건 어떻게 할지 조금 더 고민해보기) (***수정필요***)
        if startTime == currentTime{
            
        }else{
            
        }
    }
    
    @IBAction func btnChocie(_ sender: UIButton) {
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// 그라데이션 위한 extension
extension UIView{
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}
