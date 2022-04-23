import UIKit

class FirstViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var anyTextTF: UITextField!
    @IBOutlet weak var anyTextLabel: UILabel!
    //MARK: Global Variables
    var tfText: String?
    var labelText: String?
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.title = "First VC"
        self.anyTextTF.backgroundColor = .green
        self.anyTextLabel.backgroundColor = .yellow
    }
    
    //MARK: Data Passing Button Action
    @IBAction func dataPassingToVC2() {
        guard let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            print("Second View Controller not Present")
            return
        }
        vc2.labelText2 = self.anyTextTF.text                //forward Navigation - 1
        vc2.delegateVC2 = self                              //Backward Navigation - 6
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}
//MARK: Back Data Passing Protocol Method
extension FirstViewController: DataPassingProtocol {        //Backward Navigation - 5
    func passData(anyText: String?) {
        self.anyTextLabel.text = anyText
        self.anyTextTF.text = ""                       // Done just to clear the first VC textField while Poping Back (not necessary)
    }
}

