//
//  main.swift
//  Tasks Swift
//
//  Created by Артур Дохно on 31.07.2022.
//

import Foundation

// Задача 1: Проверка символов на уникальность

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

print(uniquenessCheck1(input: "arta"))

func uniquenessCheck2(input: String) -> Bool {
    return Set(input).count == input.count
}

print(uniquenessCheck2(input: "wa"))
