//
//  ViewController.swift
//  FinalProject
//
//  Created by Akniyet Turdybay on 25.05.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var collectionView : UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.register(ConfigureCell.self, forCellWithReuseIdentifier: ConfigureCell.identifier)
        return collectionView
    }()
    
    
    let items = [User(imageName: "image_1", fullname: "Yulya Vasilisova", roleDetail: "IOS Developer"),
                 User(imageName: "image_2", fullname: "Kate Winslet", roleDetail: "Data Analyst"),
                 User(imageName: "image_3", fullname: "Maria Raylet", roleDetail: "Android Developer"),
                 User(imageName: "image_4", fullname: "Mad Merdek", roleDetail: "IOS Developer"),
                 User(imageName: "image_5", fullname: "Hannah Baker", roleDetail: "Baker"),
                 User(imageName: "image_6", fullname: "Nataly Portman", roleDetail: "Actress"),
                 User(imageName: "image_7", fullname: "Paris Hillton", roleDetail: "Entertainer"),
                 User(imageName: "image_8", fullname: "Jim Kerry", roleDetail: "Actot"),
                 User(imageName: "image_9", fullname: "Anna Caalmen", roleDetail: "IOS Developer"),
                 User(imageName: "image_10", fullname: "Ariana Grande", roleDetail: "Singer")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        configUI()
        collectionViewLayout()
    }
    
    
    private func configUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    private func collectionViewLayout(){
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.leading.equalToSuperview().inset(15)
            make.bottom.equalToSuperview()

        }
    }
}

extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfigureCell.identifier, for: indexPath) as! ConfigureCell
        cell.configure(user: items[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedInfoVC = DetailInfoViewController()
        self.navigationController?.pushViewController(detailedInfoVC, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 20, height: view.frame.size.width / 2 - 15)
    }
}




