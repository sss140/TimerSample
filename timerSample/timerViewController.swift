
import UIKit

class timerViewController: UIViewController {
    var count:Int = 0
    let imageArray:[UIImage] =
        [UIImage(named: "a.jpg")!,
         UIImage(named: "b.jpg")!,
         UIImage(named: "c.jpg")!,
         UIImage(named: "d.jpg")!,
         UIImage(named: "e.jpg")!,
         UIImage(named: "f.jpg")!,]
    
    let imageView = UIImageView()
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = self.view.frame
        imageView.contentMode = .scaleAspectFill
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        selectImage(n: count)
        // Do any additional setup after loading the view.
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countUp), userInfo: nil, repeats: true)
    }
    @objc func countUp(){
        print(count)
        self.count += 1
        if self.count >= imageArray.count{
            myTimer.invalidate()
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "mainVC")
            nextVC?.modalTransitionStyle = .partialCurl
            present(nextVC!,animated: true,completion: nil)
        }else{
            selectImage(n: count)
        }
    }
    func selectImage(n:Int){
        imageView.image = imageArray[n]
    }
}
