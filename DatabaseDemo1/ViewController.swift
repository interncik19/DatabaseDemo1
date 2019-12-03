
import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let student: Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: DatabaseController.getContext()) as! Student
        
        student.firstName = "Jose"
        student.lastName = "Garcia"
        student.age = 36
        
        DatabaseController.saveContext()
        
        let fetchRequest:NSFetchRequest<Student> = Student.fetchRequest()
        
        do{
            let searchResult = try DatabaseController.getContext().fetch(fetchRequest)
            print("number of result: \(searchResult.count)")
            
            for result in searchResult as [Student]{
                print("\(result.firstName!) is \(result.age) years old")
            }
        }
        catch{
            print("Error: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

