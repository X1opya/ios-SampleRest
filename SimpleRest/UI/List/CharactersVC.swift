
import UIKit

class CharactersVC: BaseViewController {
  
  var collectionView: UICollectionView?
  var vm: CharactersVM?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.title = "SimpleRest"
    vm?.delegate = self
    createCollectionView()
    createLoading()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    vm?.loadCharacters()
    
  }
  
  private func createCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    layout.itemSize = CGSize(width: 400, height: 400)
    collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView?.backgroundColor = .yellow
    view.addSubview(collectionView!)
  }
  
  private func setCollectionDataSource(list: [CharacterDto]) {
    DispatchQueue.main.async {
      guard !list.isEmpty else { return }
      
      print("list set ")
      self.collectionView?.dataSource = self
      self.collectionView?.delegate = self
    }
  }
  
  func showFullScreen(_ character: CharacterDto) {
    let vc = FullScreenImageVC(character: character)
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension CharactersVC : CharactersDelegate {
  func onSuccess(_ list: [CharacterDto]) {
    setCollectionDataSource(list: list)
  }
  
  func onLoading(isLoading: Bool) {
    loading(isLoading)
  }
  
  func onError(msg: String) {
    showToast(message: msg)
  }
}
