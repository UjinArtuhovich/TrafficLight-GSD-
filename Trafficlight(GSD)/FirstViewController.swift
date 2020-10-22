import UIKit
var constant: Int!
class FirstViewController: UIViewController {
    let GreenButton: UIButton = {
        let gb = UIButton()
        gb.backgroundColor = .green
        gb.setTitle("PRESS", for: .normal)
        gb.setTitleColor(.black, for: .normal)
        gb.addTarget(self, action: #selector(actionForGB), for: .touchUpInside)
        return gb
    }()
    let YellowButton: UIButton = {
        let yb = UIButton()
        yb.backgroundColor = .yellow
        yb.setTitle("PRESS", for: .normal)
        yb.setTitleColor(.black, for: .normal)
        yb.addTarget(self, action: #selector(actionForYB), for: .touchUpInside)
        return yb
    }()
    let RedButton: UIButton = {
        let rb = UIButton()
        rb.backgroundColor = .red
        rb.setTitle("PRESS", for: .normal)
        rb.setTitleColor(.black, for: .normal)
        rb.addTarget(self, action: #selector(actionForRB), for: .touchUpInside)
        return rb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Traffic Light";
        stackForMenu()
    }
    
    @objc func  actionForRB() {
        let nvc = SecondViewController()
        navigationController?.pushViewController(nvc, animated: true)
        constant = 1
    }
    @objc func  actionForYB() {
        let nvc = SecondViewController()
        navigationController?.pushViewController(nvc, animated: true)
        constant = 2
    }
    @objc func  actionForGB() {
        let nvc = SecondViewController()
        navigationController?.pushViewController(nvc, animated: true)
        constant = 3
    }
    
    
    func stackForMenu() {
        let stack = UIStackView(arrangedSubviews: [RedButton, YellowButton, GreenButton])
        stack.axis  = .vertical
        stack.distribution  = .fillEqually
        stack.spacing = 50.0
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

