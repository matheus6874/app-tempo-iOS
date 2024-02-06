//
//  ViewController.swift
//  Aplicativo Do Tempo
//
//  Created by Matheus S. C. on 05/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var customView: UIView = {//Só cria a View quando for instanciada pela primeira vez
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
         view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Executa sempre que o controller é carregado
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //Executa todas as vezes que a tela é exibida, ex vai para outra tela e volta
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //Executa antes do viewDidAppear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //Executa depois do viewDidAppeear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //Quando ela vai desaparecer ou quando já desapareceu
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func setupView(){
        view.backgroundColor = UIColor.red
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        view.addSubview(customView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.topAnchor,constant: 100),
            customView.leadingAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            customView.trailingAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            customView.bottomAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }

}

