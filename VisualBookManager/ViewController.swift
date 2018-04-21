//
//  ViewController.swift
//  VisualBookManager
//
//  Created by 사명구 on 2018. 4. 17..
//  Copyright © 2018 Quest4I. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var myBookManager = BookManager()

    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!

    @IBOutlet weak var countLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let book1 = Book(name: "햄릿", genre: "비극", author: "셰익스피어")
        let book2 = Book(name: "누구를 위하여 종을 울리나", genre: "전쟁소설", author: "헤밍웨이")
        let book3 = Book(name: "죄와벌", genre: "사실주의", author: "톨스토이")

        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        countLabel.text = "\(myBookManager.countBooks())"
    }

    @IBAction func searchAction(_ sender: Any) {
        if nameTextField.text!.isEmpty {
            outputTextView.text = "Input a book title to search!"
            return
        }
        let resultBook = myBookManager.searchBook(name: nameTextField.text!)
        if resultBook == nil {
            outputTextView.text = "We don't have book that you search. ^^"
            return
        }
        outputTextView.text = resultBook
        allClear()
    }

    @IBAction func registerAction(_ sender: Any) {
        var bookTemp = Book()

        bookTemp.name = nameTextField.text!
        if bookTemp.name!.isEmpty {
            outputTextView.text = "Title is empty."
            return
        }
        bookTemp.author = authorTextField.text!
        bookTemp.genre = genreTextField.text!

        myBookManager.registerBook(bookObject: bookTemp)
        outputTextView.text = "\(nameTextField.text!) has been registered"
        countLabel.text = "\(myBookManager.countBooks())"
        allClear()
    }

    @IBAction func removeAction(_ sender: Any) {
        if nameTextField.text!.isEmpty {
            outputTextView.text = "Title is empty."
            return
        }
        myBookManager.removeBook(name: nameTextField.text!)
        outputTextView.text = "\(nameTextField.text!) removed."
        countLabel.text = "\(myBookManager.countBooks())"
        allClear()
    }

    @IBAction func showAllBookAction(_ sender: Any) {
//        print(myBookManager.showAllBooks())
        outputTextView.text = myBookManager.showAllBooks()
        countLabel.text = "\(myBookManager.countBooks())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func allClear() {
        nameTextField.text!.removeAll()
        authorTextField.text!.removeAll()
        genreTextField.text!.removeAll()
    }
}
