//
//  SecondViewController.swift
//  To Do List
//
//  Created by Alejandro Terrazas on 16/12/15.
//  Copyright (c) 2015 Alejandro Terrazas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

  @IBOutlet weak var item: UITextField!
  
  @IBAction func addItem(sender: AnyObject)
  {
    toDoList.append(item.text)
    item.text = ""
    NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //Función para esconder el teclado cuando se da touch fuera de el
  override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
  {
    self.view.endEditing(true)
  }
  
  //Función para que el botón de return esconda el teclado
  func textFieldShouldReturn(textField: UITextField!) -> Bool
  {
    item.resignFirstResponder()
    return true;
  }
  
}

