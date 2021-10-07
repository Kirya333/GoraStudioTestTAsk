//
//  UserPhotoTableViewCell.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 07.10.2021.
//

import UIKit

class UserPhotoTableViewCell: UITableViewCell {

    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var additionalBackgroundView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoLoadingActivityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with photo: Photo) {
        if #available(iOS 13.0, *) {
            photoLoadingActivityIndicator.style = .large
        } else {
            photoLoadingActivityIndicator.style = .gray
        }
        
        let userPhotoViewModel = UserPhotoViewModel(photoModel: photo)
        
        setupAdditionalBackground()
        
        photoLoadingActivityIndicator.startAnimating()
        
        photoTitleLabel.text = userPhotoViewModel.title
        
        photoImageView.downloadImage(from: userPhotoViewModel.url) {
            (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.photoLoadingActivityIndicator.stopAnimating()
        }
        
    }
    
    private func setupAdditionalBackground() {
        additionalBackgroundView.layer.cornerRadius = 5
        additionalBackgroundView.layer.borderWidth = 1
        additionalBackgroundView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
