//
// Created by 사명구 on 2018. 4. 15..
// Copyright (c) 2018 Quest4I. All rights reserved.
//

import Foundation

class BookManager {

    var bookList = [Book]()

    func registerBook(bookObject: Book) {
        bookList += [bookObject]
    }

    func showAllBooks() -> String {
        var strTemp = ""
        for bookTemp in bookList {
            strTemp += bookTemp.toString()
        }
        return strTemp
    }

    func countBooks() -> Int {
        return bookList.count
    }


    func searchBook(name: String) -> String? {
        var strTemp = ""
        for bookTemp in bookList {
            if bookTemp.name == name {
                return bookTemp.toString()
            }
        }
        return nil
    }

    func removeBook(name: String) {
        for (index, value) in bookList.enumerated() {
            if value.name! == name {
                bookList.remove(at: index)
            }
        }
    }
}
