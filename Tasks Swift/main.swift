//
//  main.swift
//  Tasks Swift
//
//  Created by Артур Дохно on 31.07.2022.
//

import Foundation

// MARK: Задача 1: Проверка символов на уникальность

// Задание: Написать функцию, которая принимает строку как свой единственный параметр и возвращает true если строка содержит только уникальные символы.

// Решение:

func uniquenessCheck1(input: String) -> Bool {
    var checkedSymbols = [Character]()

    for symbol in input {
        if checkedSymbols.contains(symbol) {
            return false
        }
        checkedSymbols.append(symbol)
    }
    return true
}

//print(uniquenessCheck1(input: "Hello"))

func uniquenessCheck2(input: String) -> Bool {
    return Set(input).count == input.count
}

//print(uniquenessCheck2(input: "Hi"))


// MARK: Задача 2: Является ли строка палиндромом ?

// Задание: Написать функцию которая принимает строку и возвращает true если строка является палиндромом

// Решение:

func checkReversed(text: String) -> Bool {
    let textNoSpaceAndLowercased = text.replacingOccurrences(of: " ", with: "").lowercased()
    return String(textNoSpaceAndLowercased.reversed()) == textNoSpaceAndLowercased
}

print(checkReversed(text: "А роза упала на лапу Азора"))

