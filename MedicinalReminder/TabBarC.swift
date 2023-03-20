//
//  TabBarC.swift
//  MedicinalReminder
//
//  Created by Jwr on 2023/3/20.
//

import UIKit
import YPImagePicker

class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let vc = viewController as? PostVC {
            var config = YPImagePickerConfiguration()
            
            // MARK: 通用配置

            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            
            config.showsPhotoFilters = false
            config.showsVideoTrimmer = false
            
            config.shouldSaveNewPicturesToAlbum = true
            config.albumName = "该吃药了"
//            if let appName = Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String {
//
//            } else {
//                Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
//            }
            
            config.startOnScreen = YPPickerScreen.library
            config.screens = [.library, .photo]
            
            config.maxCameraZoomFactor = 5
            // MARK: 相册配置
            
            
            config.library.mediaType = YPlibraryMediaType.photo
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.minNumberOfItems = 1
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 2
            config.library.skipSelectionsGallery = false
            
            config.library.preSelectItemOnMultipleSelection = true
            
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
//                    print(photo.originalImage) // original image selected by the user, unfiltered
                    print(photo.modifiedImage) // Transformed image, can be nil
                    print(photo.exifMeta) // Print exif meta data of original image.
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
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
