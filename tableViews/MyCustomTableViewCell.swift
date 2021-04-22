//
//  MyCustomTableViewCell.swift
//  tableViews
//
//  Created by David Bueno on 21/4/21.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    
    @IBOutlet weak var mySecondLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Cambimos la fuente de la primera label y la ponemos en negrita
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        //color de texto de la primera label
        myFirstLabel.textColor = .blue
        
        
        //para que tenga líneas infinitas
        
        mySecondLabel.numberOfLines = 0
        
        //color de fondo de la celda
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       //vamos a imprimir el texto de la first label
        print(myFirstLabel.text ?? "") //como el valor de label puede ser nulo con los simbolos ?? seguido de comillas dobles
        //vacias indicamos que puede ser que contenga texto sin nada. asi no nos dará errror en el caso este de que no tenga
        //nada de texto.
    }
    
}
