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

//print(checkReversed(text: "А роза упала на лапу Азора"))

// MARK: Задача 3: Идентичны ли строки между собой ?

// Задание: Написать функцию которая принимает две строки и возвращает true если эти строки содержат одинаковые символы в любом порядке

// Решение:

func checkIdentity1(text1: String, text2: String) -> Bool {
    return text1.sorted() == text2.sorted()
}

//print(checkIdentity1(text1: "art", text2: "atr"))

func checkIdentity2(text1: String, text2: String) -> Bool {
    var checkText = text2
    
    for letter in text1 {
        if let index = checkText.firstIndex(of: letter) {
            checkText.remove(at: index)
        } else {
            return false
        }
    }
    
    return checkText.count == 0
}

//print(checkIdentity2(text1: "atr", text2: "art"))

// MARK: Задача 4: Содержит ли одна строка другую?

// Задание: Написать функцию которая принимает одну строку и возвращает true если эта строка полностью содержится в другой строке игнорируя регистр

// Решение:

let str1 = "Hello Swift"

//print(str1.lowercased().contains("swift"))

extension String {
    func customContains(_ string: String) -> Bool {
        return self.lowercased().contains(string.lowercased())
    }
}

//print(str1.customContains("swift"))

// MARK: Задача 5: Сколько раз символ встречается в строке ?

// Задание: Написать функцию которая принимает строку и символ и возвращает количество раз которое данный символ встречается в строке с учетом регистра

// Решение:

func checkCountChar(_ str: String,_ char: Character) -> Int {
    var letterCount = 0
    
    for letter in str.lowercased() {
        if letter == char {
            letterCount += 1
        }
    }
    return letterCount
}

//print(checkCountChar("aRtur", "r"))

func checkCountChar2(_ str: String,_ char: Character) -> Int {
    return str.lowercased().reduce(0) {
        $1 == char ? $0 + 1 : $0
    }
}

//print(checkCountChar2("aRtur", "r"))


// Задача с собеседования

let array: [Any] = [1, 2, 3, [4, 5], [6, 7, [8, 9, 10]], 11]
let arrayClean: [Any] = [1, 2, 3, 4]
let arrayComplex = [array, array, [array]]

func solution<T>(_ array: [Any]) -> [T] {
    var result = [T]()
    
    for element in array {
        if let element = element as? T {
            result.append(element)
        } else if let element = element as? [Any] {
            result.append(contentsOf: solution(element))
        }
    }
    return result
}

//print(solution(array) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])

// MARK: Задача 6: Удаление повторяющихся символов из строки ?

// Задание: Написать функцию которая принимает строку и возвращает строку с удаленными повторяющимся символами

// Решение:

func removeRepeatChar(_ str: String) -> String {
    var result = ""
    for letter in str {
        if !result.contains(letter) {
            result.append(letter)
        }
    }
    return result
}

//print(removeRepeatChar("Hellooo"))
 
// MARK: Задача Амазона из интервью

// Задание: Написать функцию которая принимает массив чисел, нужно выбрать два максимальных числа что бы получить максимальную площадь из них для заполнения водой. Должно получится 49

// Решение: O(n)

func getmaxArea(_ height: [Int]) -> Int {
    guard !height.isEmpty else { return 0 }
    
    var maxArea = 0
    var left = 0
    var right = height.count - 1
    
    while left < right {
        // Пересчитать максимальную площадь
        let minHight = min(height[left], height[right])
        let currentHight = minHight * (right - left)
        maxArea = max(maxArea, currentHight)
        
        // Переместить указатели
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return maxArea
}

let input = [1, 8, 6, 2, 5, 4, 8, 3, 7]
let result = getmaxArea(input)
//print("Result: \(result)\n")

// MARK: Задача 7: Сокращение количества пробелов до одного

// Задание: Написать функцию которая принимает строку и возвращает строку с замененным множеством пробелов на один пробел

// Решение:

func space(_ input: String) -> String {
    var seenSpace = false
    var result = ""
    
    for letter in input {
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        result.append(letter)
    }
    
    return result
}

//print(space("a   b"))


// MARK: Задача 7: Возвращение строки

// Задание: Написать функцию которая принимает две строки и возвращает тру если одна строка является вращением другой, с учетом регистра

// Решение:

func rotate(_ input: String, _ rotated: String) -> Bool {
    guard input.count == rotated.count else { return false }
    let combined = input + input
    return combined.contains(rotated)
}
 
print(rotate("abc", "cab"))
