//
//  ViewController.swift
//  tableViews
//
//  Created by David Bueno on 21/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //constante privada array de strings nombre de paises
    private let myCountrys = ["España","Mexico","Perú","Colombia","Argentina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        //protocolo delegado para recoger eventos
        
        tableView.delegate = self
        
        //para conectar la celda personalizada al la tabla
        //hace que entienda la tabla que una de las celdas es de tipo myCustomViewCell
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        
        
        //para quitar las celdas que no tienen contenido
        //le asiganmos a la propiedad footer de la tabla
        //una vista vacía
        //tableView.tableFooterView = UIView()
    }


}
//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource{
    
    //función para implementar una cabecera a la tabla
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "Celdas Custom"
    }
    
    //para modificar la altura de la celda de la cabecera
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    //implementar un pie a la tabla
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0{
            return "Footer simple"
        }
        return "Footer Custom"
    }
    
    //modificar la altura del pie
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myCountrys.count
    }
    //para indicar el número de secciones que contiene la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //para redimensionar el alto de las celdas de la tabla
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //si estamos en la sección 0 la altura es de 50 si es la seccion es dos la altura es de 150
        
        if indexPath.section == 0{
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Vamos a diferenciar la seccion 1 de la 2
        
        //si estamos en  la seccion 1 que corresponde a indice 0 que pinte las celdas por default
        if indexPath.section == 0{
            
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        
        //comprobar si es nula la celda a pintar en pantalla
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
            
            //para modificar el estilo de las celdas
            cell?.backgroundColor = .gray //Color gris
            
            //tamaño de la fuente de 20
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            
            //para poner elementos a las celdas ej check o
            //Flechas indicadoras
            
           // cell?.accessoryType = .checkmark
            
            
            
            cell?.accessoryType = .disclosureIndicator
            
            
           //cambiar el color de cada
            //celda
            /*
            if indexPath.row == 0 {
               
                
                cell?.backgroundColor = .blue
            }
            if indexPath.row == 1 {
                cell?.backgroundColor = .red
            }
            if indexPath.row == 2 {
                cell?.backgroundColor = .green
            }
            if indexPath.row == 3 {
                cell?.backgroundColor = .systemPink
            }
            if indexPath.row == 4 {
                cell?.backgroundColor = .purple
            }
            
           */
            
            
            //cambiar el color de la celda cunado es
            //Seleccionado
            
            let backgroundView  = UIView()
             
              if indexPath.row == 0 {
                  
                  backgroundView.backgroundColor = .blue
                
              }
            if indexPath.row == 1 {
                
                backgroundView.backgroundColor = .red
              
            }
            if indexPath.row == 2 {
                
                backgroundView.backgroundColor = .green
              
            }
            if indexPath.row == 3 {
                
                backgroundView.backgroundColor = .purple
              
            }
            if indexPath.row == 4 {
                
                backgroundView.backgroundColor = .magenta
              
            }
            
            cell?.selectedBackgroundView = backgroundView
            
        }
        //creamos una constante para guardar uiviewcell y
        //Despues asignarla a cada elemento del array
        //De esta forma se crea un celda por cada elemento
        //Del array
        
      
        //cubrir una celda con una etiqueta que muestra el
        //nombre de cada pais
        
        //El indexPath.row recorre cada elemento del array
        //y lo asigna al label
        
        cell!.textLabel?.text = myCountrys[indexPath.row]
        
        return cell!
        }else{
            //y si no es la seccion 2
            //pintamos la celda personalizada
            
            let cell =  tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell // Le indicamos que es //la celda custom con as?
            // y el nombre de la celda
            
            
            
            //Podemos acceder a propiedades custom de la celda
            
            //le asignamos el primer elmento del array a la primera etiqueta
            cell?.myFirstLabel.text =  String(indexPath.row + 1)
            
            //accedemos a la segunda label
            cell!.mySecondLabel.text? = myCountrys[indexPath.row]
            
            cell!.mySecondLabel.text? = "ajdnlaksndañsdnasdlaknkdasndñadnasndkandsndladlsndsañdalksndsdnalksndksadnkasdnsada"
            
            
            //por último devuelve la celda custom
            return cell! // signo de admiración para desempaquetar si es nulo
        }
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    //implemente el evento del click
    //cada vez que se haga click se llama a esta función
    //en el indexPath se indica el indice del elemento
    //seleccionado
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
}
