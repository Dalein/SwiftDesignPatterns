import UIKit

class Compiler {
    func analyze() {}
    func parse() {}
    func generate() {}
    func optimize() {}
    func output() {}
    
    func compile(filename: String) {
        analyze()
        parse()
        generate()
        optimize()
        output()
    }
    
}

/**
 That has empty implementations of each method, each of which are called in sequence
 when `compile()` is run.
 */


/**
 We could then create a subclass called **PascalCompiler** that replaces the first two steps with custom implementations.
 */

class PascalCompiler: Compiler {
    
    override func analyze() {
        print("Analysing Pascal")
    }
    
    override func parse() {
        print("Parsing Pascal")
    }
    
}

/**
 That leaves the other three steps untouched, doing all the work they need to do.
 */


let pCompiler = PascalCompiler()
pCompiler.compile(filename: "myfile.pas")

