
import UIKit

class SecondViewController: UIViewController {
    let imageView: UIImageView = {
        let im = UIImageView()
        im.layer.masksToBounds = true
        im.layer.cornerRadius = 150
        return im
    }()
    let ActivityIndecator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        return ai
    }()
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            ActivityIndecator.stopAnimating()
            ActivityIndecator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constraintForImage()
        constraintForAI()
        fetchImageURl()
    }
    
    fileprivate func fetchImageURl(){
        var imageURL: URL!
        switch constant {
        case 1:
            imageURL = URL(string: "https://pngimg.com/uploads/sign_stop/sign_stop_PNG25636.png")
        case 2:
            imageURL = URL(string: "https://res.cloudinary.com/jerrick/image/upload/fl_progressive,q_auto,w_1024/mncthuzw1xtldbmem85l.png")
        case 3:
            imageURL = URL(string: "https://webstockreview.net/images/go-clipart-png.png")
        default:
            imageURL = nil
        }
        ActivityIndecator.startAnimating()
        ActivityIndecator.isHidden = false
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = imageURL, let imagedata = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imagedata)
            }
        }
    }
    
    func constraintForImage() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func constraintForAI() {
        view.addSubview(ActivityIndecator)
        ActivityIndecator.translatesAutoresizingMaskIntoConstraints = false
        ActivityIndecator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        ActivityIndecator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}



