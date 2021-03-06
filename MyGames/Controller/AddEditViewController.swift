//
//  AddEditViewController.swift
//  MyGames
//
//  Created by Glayce on 07/04/20.
//  Copyright © 2020 Glayce. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {
    //Controles da view
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dpReleaseDate: UIDatePicker!
    @IBOutlet weak var btnAddEdit: UIButton!
    @IBOutlet weak var btnCover: UIButton!
    @IBOutlet weak var ivCover: UIImageView!    

    //Variaveis da classe
    var game: Games!
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        return pickerView
    }()
    var consolerManager = ConsolesManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfConsole.inputView = pickerView
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        consolerManager.loadConsoles(with: context)
    }
    
    @IBAction func addEditCover(_ sender: UIButton) {
    }
    
    @IBAction func addEditGame(_ sender: UIButton) {
        if game == nil {
            game = Games(context: context)
        }
        
        //Atribui ao objeto os valores digitados
        game.title = tfTitle.text
        game.releaseDate = dpReleaseDate.date
        
        //Persiste as informacoes no contexto com o coredata
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        //Apos salvar volta para a tela anterior
        navigationController?.popViewController(animated: true)
    }
}

extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consolerManager.consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let console = consolerManager.consoles[row]
        return console.name
    }
}
