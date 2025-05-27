//
//  main.swift
//  StructVSCalsses
//
//  Created by Maksym Poskannyi on 27.05.2025.
//

import Foundation

print("Hello, World!")

var hero = ClassSuperhero(name: "Maksym", universe: "DC")

var anotherMarvelHero = hero
anotherMarvelHero.name = "Another Maksym"

print("Hero name: \(hero.name)")
print("Another hero name: \(anotherMarvelHero.name)")
