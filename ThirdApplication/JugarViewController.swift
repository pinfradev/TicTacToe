//
//  JugarViewController.swift
//  ThirdApplication
//
//  Created by Fray Pineda on 1/2/19.
//  Copyright © 2019 Fray Pineda. All rights reserved.
//

import UIKit

class JugarViewController: UIViewController {
    
    
    @IBOutlet weak var ganadorLabel: UILabel!
    
    @IBOutlet weak var nuevojuegoButton: UIButton!
    @IBOutlet weak var vistaFondo: UIImageView!
    
    var juegoActivo = true
    var jugadorActivo = 1
    var estadoJuego = [0,0,0,0,0,0,0,0,0]
    let combinacionGanadora = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func action(_ sender: UIButton) {
    
        if(estadoJuego[sender.tag - 1] == 0) {
            
            estadoJuego[sender.tag - 1] = jugadorActivo
            
            if(jugadorActivo == 1) {
                sender.setImage(UIImage(named: "X.png"), for: UIControlState())
                jugadorActivo = 2
                
            } else {
                sender.setImage(UIImage(named: "O.png"), for: UIControlState())
                jugadorActivo = 1
            }
        }
     
        for combinaciones in combinacionGanadora {
            if estadoJuego[combinaciones[0]] != 0 && estadoJuego[combinaciones[0]] == estadoJuego[combinaciones[1]] && estadoJuego[combinaciones[1]] == estadoJuego[combinaciones[2]] {
                
                juegoActivo = false
                if estadoJuego[combinaciones[0]] == 1 {
                    ganadorLabel.text = "GANADOR ES LA ❌"
                } else {
                    ganadorLabel.text = "GANADOR ES LA ⭕️"

                }
                
                vistaFondo.image = nil
                nuevojuegoButton.isHidden = false
                ganadorLabel.isHidden = false
            }
            
            juegoActivo = false
            
            for i in estadoJuego {
                if i == 0 {
                    juegoActivo = true
                    break
                }
            }
            
            if juegoActivo == false {
                ganadorLabel.text = "JUEGO EMPATADO"
                ganadorLabel.isHidden = false
                nuevojuegoButton.isHidden = false
            }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func juegoNuevo(_ sender: UIButton) {
        estadoJuego = [0,0,0,0,0,0,0,0,0]
        juegoActivo = true
        jugadorActivo = 1
        
        nuevojuegoButton.isHidden = true
        ganadorLabel.isHidden = false
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
        
        vistaFondo.image = #imageLiteral(resourceName: "Message")
        ganadorLabel.text = "El ganador es: "
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
