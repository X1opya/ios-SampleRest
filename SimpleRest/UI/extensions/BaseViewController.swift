
import UIKit

class BaseViewController: UIViewController {
  
  private lazy var progressView = UIActivityIndicatorView()
  
  func showLoading() {
    
    DispatchQueue.main.async {
      self.progressView.startAnimating()
    }
  }
  
  func hideLoading() {
    DispatchQueue.main.async {
      self.progressView.stopAnimating()
    }
  }
  
  func loading(_ isLoading: Bool) {
    if isLoading == true {
      showLoading()
    } else {
      hideLoading()
    }
  }
  
  func showToast(message : String) {
    DispatchQueue.main.async {
      let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
      toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
      toastLabel.textColor = UIColor.white
      toastLabel.textAlignment = .center;
      toastLabel.text = message
      toastLabel.alpha = 1.0
      toastLabel.layer.cornerRadius = 10;
      toastLabel.clipsToBounds  =  true
      self.view.addSubview(toastLabel)
      UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
      }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
      })
      
    }
  }
  
  func createLoading() {
    progressView = UIActivityIndicatorView()
    view.addSubview(progressView)
    progressView.color = .blue
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.sizeToFit()
    NSLayoutConstraint.activate([
      progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      progressView.topAnchor.constraint(equalTo: view.topAnchor),
      progressView.leftAnchor.constraint(equalTo: view.leftAnchor)
    ])
  }
 
}
