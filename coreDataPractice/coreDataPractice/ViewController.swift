//
//  ViewController.swift
//  coreDataPractice
//
//  Created by Junhong Park on 2021/08/27.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. [start] VC로 appDelegate에서 생성했던 Persistent Container 전달
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.container = appDelegate.persistentContainer
        // [end] VC로 appDelegate에서 생성했던 Persistent Container 전달
        
        // 3. [start] entity 가져오기
        guard let entity = NSEntityDescription.entity(forEntityName: "PhoneBook", in: self.container.viewContext) else { return }
        // 여기서 guard를 해줘야 하는 이유?
        // [end] entity 가져오기
        
        // [start] NSManagedObject 생성
        let person = NSManagedObject(entity: entity, insertInto: self.container.viewContext)
        person.setValue("42seoul Student", forKey:  "detail")
        person.setValue("junhpark", forKey: "name")
        person.setValue("010-9793-5577", forKey: "number")
        // [end] NSManagedObject 생성
        
        // 5. [start] NSManagedObjectContext에 저장
        do {
            try self.container.viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        // [end] NSManagedObjectContext에 저장
        
        fetchContact()
      
    }
    // 6. [start] test를 위해 데이터 저장되었는지 print
    func fetchContact() {
        do {
            let contact = try self.container.viewContext.fetch(PhoneBook.fetchRequest()) as! [PhoneBook]
            print(contact[0].name ?? "none")
            print(contact[1].number ?? "none")
            print(contact[2].detail ?? "none")
        } catch {
            print(error.localizedDescription)
        }
    }
    // [end] test를 위해 데이터 저장되었는지 print


}

