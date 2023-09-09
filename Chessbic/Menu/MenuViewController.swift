//
//  MenuViewController.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-09.
//

import UIKit

class MenuViewController: UIViewController {

    lazy var btnLogin: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
        btn.backgroundColor = .blue
        btn.setTitle("Log in", for: .normal)
        btn.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(btnLogin)
        
        btnLogin.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc
    func goToLogin() {
        navigationController?.show(AuthenticationViewController(), sender: nil)
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
