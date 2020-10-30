import UIKit

protocol Compiler {
    func analyze()
    func parse()
    func generate()
    func optimize()
    func output()
    
    func compile(filename: String)
}


/**
 We can then create a protocol extension that implements default functionality for all those methods:
 */

extension Compiler {
    func analyze() { }
    func parse() { }
    func generate() { }
    func optimize() { }
    func output() { }

    func compile(filename: String) {
        analyze()
        parse()
        generate()
        optimize()
        output()
    }
    
}


/**
 At this point we effectively have the same result as the original **Compiler** class, except now it’s a protocol.
 
 The next step is to create a protocol that implements just the part responsible for the first two steps for Pascal:
 */

protocol PascalFrontEnd: Compiler {}

extension PascalFrontEnd {
    
    func analyze() {
        print("Analysing Pascal")
    }
    
    func parse() {
        print("Parsing pascal")
    }
    
}


protocol ARM64BackEnd: Compiler {}

extension ARM64BackEnd {

    func output() {
        print("Writing ARM code")
    }
    
}


/**
 Finally it’s time to create a concrete type: a **PascalForARM** struct that conforms to both `PascalFrontEnd` and `ARM64BackEnd`:
 */

struct PascalForARM64: PascalFrontEnd, ARM64BackEnd {}

/**
 Look at that – our struct needs no code because it’s just putting protocols together like Lego bricks. Now we can instantiate that struct and run it with some code:
 */

let pCompiler = PascalForARM64()
pCompiler.compile(filename: "myfile.pass")


/**
 If this were real code, you’d go ahead and create **ARM32BackEnd**, **CSharpFrontEnd**, and so on: one front-end for each language, and one back-end for each CPU architecture. All possible combinations could then be assembled using no extra code, just like **PascalForARM64**.
 */
