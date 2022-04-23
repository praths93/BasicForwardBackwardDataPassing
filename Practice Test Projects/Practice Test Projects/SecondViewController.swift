
import UIKit

protocol DataPassingProtocol {                              //Backward Navigation  - 1
    func passData(anyText: String?)
}

class SecondViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var anyTextTF2: UITextField!
    @IBOutlet weak var anyTextLabel2: UILabel!
    //MARK: Global Variable
    var tfText2: String? = ""
    var labelText2: String? = ""
    var delegateVC2: DataPassingProtocol?                   //Backward Navigation - 2
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second VC"
        self.view.backgroundColor = .cyan
        self.anyTextLabel2.backgroundColor = .orange
        self.anyTextTF2.backgroundColor = .yellow
        self.navigationItem.hidesBackButton = true
        self.anyTextLabel2.text = self.labelText2           //forward Navigation - 2
    }
    //MARK: Data Passing Button Action
    @IBAction func dataPassingToVC1() {
        guard let delegate = delegateVC2 else {              //Backward Navigation - 3
            print("Delegate Object of Protocol Not Present")
            return
        }
        let anytext2 = self.anyTextTF2.text
        delegate.passData(anyText: anytext2)                  //Backward Navigation - 4
        
        self.navigationController?.popViewController(animated: true)
    }
}
