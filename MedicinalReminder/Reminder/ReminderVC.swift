//
//  ReminderVC.swift
//  MedicinalReminder
//
//  Created by Jwr on 2023/3/10.
//

import UIKit
import XLPagerTabStrip

class ReminderVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        settings.style.selectedBarBackgroundColor = .systemIndigo
        settings.style.selectedBarHeight = 3
        
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
        settings.style.buttonBarItemLeftRightMargin = 0
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let totalVC = storyboard!.instantiateViewController(withIdentifier: kTotalVCID)
        let todayVC = storyboard!.instantiateViewController(withIdentifier: kTodayVCID)
        
        return [totalVC, todayVC]
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
