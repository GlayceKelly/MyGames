//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Glayce on 08/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    //Acessa o contexto das views controllers
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
