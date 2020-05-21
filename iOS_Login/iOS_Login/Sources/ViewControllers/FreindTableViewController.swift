//
//  FreindTableViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/15.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class FreindTableViewController: UIViewController {
    private var friendInformations: [FriendInfromation] = []

    @IBOutlet var friendTableView: UITableView!
    private let sections: [String] = ["my", "friend"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setfriendInformations()
        setnavi()
        friendTableView.dataSource = self
        friendTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func alertButton(_ sender: Any) {

        let actionSheet = UIAlertController()
        actionSheet.addAction(UIAlertAction(title: "친구 관리", style: .default, handler: { result in //**
        }))
        actionSheet.addAction(UIAlertAction(title: "전체 설정", style: .default, handler: { result in //**
        }))
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)

    }
    
    
    private func setnavi(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        

        //**승호님 코드 참고**
        let longTitleLabel = UILabel()
        longTitleLabel.text = "친구"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        longTitleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    private func setfriendInformations() {
        let pro1 = FriendInfromation(profileImg: .pro1, name: "박솝트", message: "왈왈!!")
        let pro2 = FriendInfromation(profileImg: .pro2, name: "시튜시튜", message: "몽몽")
        let pro3 = FriendInfromation(profileImg: .pro3, name: "뽀림이", message: "빼꼬미")
        let pro4 = FriendInfromation(profileImg: .pro4, name: "이솝트", message: "총총총총")
        let pro5 = FriendInfromation(profileImg: .pro5, name: "이솝트", message: "멀바")
        let pro6 = FriendInfromation(profileImg: .pro6, name: "이솝트", message: "아~")
        let pro7 = FriendInfromation(profileImg: .pro7, name: "이솝트", message: "빼액")
        let pro8 = FriendInfromation(profileImg: .pro8, name: "이솝트", message: "애옹ㅇ")
        let pro9 = FriendInfromation(profileImg: .pro9, name: "이솝트", message: "쀽")
        
        friendInformations = [pro1, pro2, pro3,pro4, pro5, pro6, pro7, pro8, pro9]
    }
}

extension FreindTableViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 1{
//            return sections[1]
//        }
//    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 { return 1 }
        else{ return friendInformations.count }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let MyCell = tableView.dequeueReusableCell(withIdentifier: MyCell.identifier, for: indexPath) as? MyCell else{ return UITableViewCell() }
            //MyCell.myImageView.image = "myprofile"
            MyCell.mynameLabel.text = "이솝트"
            return MyCell
        }
        else{
            guard let FriendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else{ return UITableViewCell() }
            FriendCell.setFriendInformation(proImgName: friendInformations[indexPath.row].profileImg.getImageName(), name: friendInformations[indexPath.row].name, mess: friendInformations[indexPath.row].message)
            
            return FriendCell
        }
    }
}

extension FreindTableViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            friendInformations.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20))
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: 50, height: 30))
        label.text = "친구"
        label.textColor = UIColor.init(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        
        let numlabel = UILabel(frame: CGRect(x: 40, y: 0, width: 50, height: 30))
        numlabel.text = "\(friendInformations.count)"
        numlabel.textColor = UIColor.init(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
        numlabel.font = UIFont.systemFont(ofSize: 12)

        view.addSubview(label)
        view.addSubview(numlabel)

        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 88
        }
        else{
            return 62

        }
    }
}
