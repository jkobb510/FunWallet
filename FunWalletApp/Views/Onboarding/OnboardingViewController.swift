//
//  OnboardingViewController.swift
//  FunWalletApp
//
//  Created by Seung Min Lee on 8/13/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: K.segue.showLoginScreen, sender: nil)
        
    }
    
    
    var slides: [OnBoardingSlide] = []
    var currentPage = 0 {
            didSet {
                pageControl.currentPage = currentPage
                if currentPage == slides.count - 1 {
                    nextBtn.setTitle("Get Started", for: .normal)
                } else {
                    nextBtn.setTitle("Next", for: .normal)
                }
            }
        }

    @IBAction func nextBtnClicked(_ sender: UIButton){
        if currentPage == slides.count - 1 {
                    let controller = storyboard?.instantiateViewController(identifier: "SignUp") as!SignUpViewController
                    controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
                    UserDefaults.standard.hasOnboarded = true
                    present(controller, animated: true, completion: nil)
                } else {
                    currentPage += 1
                    let indexPath = IndexPath(item: currentPage, section: 0)
                    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                }
            }
            
        
    
    override func viewDidLoad () {
        super.viewDidLoad()
        
        slides = [
            OnBoardingSlide(title: "Welcome To FunWallet", description: "Turn dating into an adventure by discovering hosted events near you", image: #imageLiteral(resourceName: "onphone")),
            OnBoardingSlide(title: "Makes Dating Easier", description: "From sending invitations, to seeing curated results, or bill splitting, Funwallet guarantees fun and convenience", image: #imageLiteral(resourceName: "Couple.png")),
            OnBoardingSlide(title: "Host your own events", description: "Bring the same experience to others", image: #imageLiteral(resourceName: "group-date.png"))
        ]
        pageControl.numberOfPages = slides.count
    }

}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath)
as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
