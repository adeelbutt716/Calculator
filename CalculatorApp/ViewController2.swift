//
//  ViewController2.swift
//  CalculatorApp
//
//  Created by Asif on 23/04/2024.
//

import UIKit
import AVFoundation
import Foundation


class ViewController2: UIViewController {
    
    @IBOutlet weak var btnScientificTitle: CustomButton!
    @IBOutlet weak var btnScientificRad: CustomButton!
   
    @IBOutlet weak var lblSin: UILabel!
    @IBOutlet weak var lblCos: UILabel!
    @IBOutlet weak var lblTan: UILabel!
    
    @IBOutlet weak var lblSinh: UILabel!
    @IBOutlet weak var lblCosh: UILabel!
    @IBOutlet weak var lblTanh: UILabel!
    
    @IBOutlet weak var btnlogy: UIButton!
    @IBOutlet weak var btnlog2: UIButton!
    @IBOutlet weak var btnln: UIButton!
    @IBOutlet weak var btnlog10: UIButton!
    
    @IBOutlet weak var btnNotNil: UIButton!
    @IBOutlet weak var btnSquar2: UIButton!
    @IBOutlet weak var btnSquar3: UIButton!
    @IBOutlet weak var btnSquary: UIButton!
    
    @IBOutlet weak var btne: UIButton!
    @IBOutlet weak var btnPi: UIButton!
    @IBOutlet weak var btnRand: UIButton!
    @IBOutlet weak var btn2Power: UIButton!
    
    @IBOutlet weak var btn3Power: UIButton!
    @IBOutlet weak var btnPower: UIButton!
    @IBOutlet weak var btnRightBracket: UIButton!
    @IBOutlet weak var btnLeftBracket: UIButton!
    
    
    var isRadMode = true
    @IBOutlet weak var topView: UIView!
    
  

    var historyList = [History]()
    @IBOutlet weak var lblFinalResult: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btnEqual: UIButton!
    
    @IBOutlet weak var tblHistory: UITableView!
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnScientificTitle.setTitle("2ⁿᵈ", for: .normal)
        btnScientificRad.setTitle("Rad", for: .normal)
        self.topView.isHidden = true
        
        self.tblHistory.delegate = self
        self.tblHistory.dataSource = self
        resultLabel.addObserver(self, forKeyPath: "text", options: [.old, .new], context: nil)
        
        // Retrieve historyList
        if let loadedHistoryList = Utilities.shared.loadHistoryList() {
            // Use loadedHistoryList
            // For example, assign loadedHistoryList to historyList
            historyList = loadedHistoryList
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.historyList.count > 0{
            DispatchQueue.main.async {
                let lastRowIndex = self.historyList.count - 1 // Assuming yourDataArray is your data source
                let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
                self.tblHistory.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
            }
        }
       
    }
    
    @IBAction func btnScientificTap(_ sender: UIButton) {
        
        switch sender.tag {
        case 0, 1:
            if btnScientificTitle.tag == 0 {
                btnScientificTitle.tag = 1
                btnScientificTitle.backgroundColor = .white
                btnScientificTitle.setTitleColor(.black, for: .normal)
                lblSin.text = "sin⁻¹"
                lblCos.text = "cos⁻¹"
                lblTan.text = "tan⁻¹"
                lblSinh.text = "sinh⁻¹"
                lblCosh.text = "cosh⁻¹"
                lblTanh.text = "tanh⁻¹"
                
            } else {
                
                btnScientificTitle.tag = 0
                btnScientificTitle.backgroundColor = UIColor(hex: "262626", alpha: 1.0)
                btnScientificTitle.setTitleColor(.white, for: .normal)
                lblSin.text = "sin"
                lblCos.text = "cos"
                lblTan.text = "tan"
                lblSinh.text = "sinh"
                lblCosh.text = "cosh"
                lblTanh.text = "tanh"
            
            }
        case 2:
            self.appendNumberToScreen(number:  lblSin.text! + "(")
            print("hello")
        case 3:
            self.appendNumberToScreen(number:  lblCos.text! + "(")
            print("hello2")
        case 4:
            self.appendNumberToScreen(number:  lblTan.text! + "(")
            print("hello")
        case 5:
            self.appendNumberToScreen(number: self.btnlogy.titleLabel!.text!)
            print("hello2")
        case 6:
            self.appendNumberToScreen(number: self.btnlog2.titleLabel!.text!)
            print("hello")
        case 7:
            // Toggle between Rad and Deg
            isRadMode.toggle()
            // Update the button title based on the current state
            if isRadMode {
                btnScientificRad.setTitle("Rad", for: .normal)
                btnScientificRad.backgroundColor = UIColor(hex: "262626", alpha: 1.0)
                btnScientificRad.setTitleColor(.white, for: .normal)
            } else {
                btnScientificRad.setTitle("Deg", for: .normal)
                btnScientificRad.backgroundColor = .white
                btnScientificRad.setTitleColor(.black, for: .normal)
            }
        case 8:
            self.appendNumberToScreen(number:  lblSinh.text!)
            print("hello2")
        case 9:
            self.appendNumberToScreen(number:  lblCosh.text!)
            print("hello")
        case 10:
            self.appendNumberToScreen(number:  lblTanh.text!)
            print("hello2")
        case 11:
            self.appendNumberToScreen(number: self.btnln.titleLabel!.text!)
            print("hello2")
        case 12:
            self.appendNumberToScreen(number: self.btnlog10.titleLabel!.text!)
            print("hello2")
        case 13:
            self.appendNumberToScreen(number: self.btnNotNil.titleLabel!.text!)
            print("hello")
        case 14:
            self.appendNumberToScreen(number: self.btnSquar2.titleLabel!.text!)
            print("hello2")
        case 15:
            self.appendNumberToScreen(number: self.btnSquar3.titleLabel!.text!)
            print("hello2")
        case 16:
            self.appendNumberToScreen(number: self.btnSquary.titleLabel!.text!)
            print("hello2")
        case 17:
            self.appendNumberToScreen(number: self.btne.titleLabel!.text!)
            print("hello")
        case 18:
            self.appendNumberToScreen(number: self.btnPi.titleLabel!.text!)
            print("hello2")
        case 19:
            self.appendNumberToScreen(number: self.btnRand.titleLabel!.text!)
            print("hello2")
        case 20:
            self.appendNumberToScreen(number: self.btn2Power.titleLabel!.text!)
            print("hello2")
        case 21:
            self.appendNumberToScreen(number: self.btn3Power.titleLabel!.text!)
            print("hello")
        case 22:
            self.appendNumberToScreen(number: self.btnPower.titleLabel!.text!)
            print("hello2")
        case 23:
            self.appendNumberToScreen(number: self.btnLeftBracket.titleLabel!.text!)
            print("hello")
        case 24:
            self.appendNumberToScreen(number: self.btnRightBracket.titleLabel!.text!)
            print("hello2")
        default:
            // Handle default case or do nothing
            break
        }
    }
    
    @IBAction func topViewTap(_ sender: UIButton) {
      
        if self.topView.isHidden == true {
            self.topView.isHidden = false
        } else {
            self.topView.isHidden = true
        }

    }
    
    @IBAction func btnPlusMinusTap(_ sender: UIButton) {
        
        if self.resultLabel.text != "0" {
            self.resultLabel.text = changeLastOperator(expression: self.resultLabel.text!)
        }
    }
    
    func changeLastOperator(expression: String) -> String {
        let operators: Set<Character> = ["+", "-", "*", "/", "%"] // Add other operators if needed
        var lastOperatorIndex = -1
        var lastNumberIndex = -1
        
        for i in stride(from: expression.count - 1, through: 0, by: -1) {
            if operators.contains(expression[expression.index(expression.startIndex, offsetBy: i)]) {
                lastOperatorIndex = i
                break
            }
        }
        
        if lastOperatorIndex == -1 {
            return "-" + expression
        }
        
        for i in stride(from: lastOperatorIndex - 1, through: 0, by: -1) {
            if !operators.contains(expression[expression.index(expression.startIndex, offsetBy: i)]) {
                lastNumberIndex = i
            } else {
                break
            }
        }
        
        let lastOperator = expression[expression.index(expression.startIndex, offsetBy: lastOperatorIndex)]
        let newOperator: Character = lastOperator == "-" ? "+" : "-"
        
        var newExpression = expression
        if lastOperator != "+" && lastOperator != "-" {
            let insertIndex = expression.index(expression.startIndex, offsetBy: lastOperatorIndex + 1)
            newExpression.insert(newOperator, at: insertIndex)
        } else {
            let replaceIndex = expression.index(expression.startIndex, offsetBy: lastOperatorIndex)
            newExpression.replaceSubrange(replaceIndex...replaceIndex, with: String(newOperator))
        }
        
        return newExpression
    }
    
    @IBAction func btnBackArrowTap(_ sender: UIButton) {
        self.playTickSound()
        self.handlReverse()

    }
        
    @IBAction func btnaNumCick(_ sender: UIButton) {
        self.playTickSound()
        print(String(sender.tag-1))
        self.appendNumberToScreen(number: String(sender.tag-1))

    }
    
    @IBAction func btnAcTap(_ sender: UIButton) {
        self.playTickSound()
        self.clearText()
    }
    
    @IBAction func btnDelTap(_ sender: UIButton) {
        self.playTickSound()
        self.historyList.removeAll()
        Utilities.shared.clearHistoryList()
        self.tblHistory.reloadData()
        self.clearText()
    }
    
    @IBAction func btnEqualTap(_ sender: UIButton) {
        
        self.playTickSound()
        self.blinkButton()
        
        if self.resultLabel.text != "0"
        {
            self.addHistory()
        }
        
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        self.playTickSound()
//        if finalResult.text != "" {
//            result.text = finalResult.text
//            finalResult.text = ""
//        }
        
//        divideButtonOutlet.isUserInteractionEnabled = false
//        plusButtonOutlet.isUserInteractionEnabled = false
//        minusButtonOutlet.isUserInteractionEnabled = false
//        commaButtonOutlet.isUserInteractionEnabled = false

        if sender.tag == 11 {
            if self.resultLabel.text == "0" {
                self.appendNumberToScreen(number: "0.")
            } else {
                self.appendNumberToScreen(number: ".")
            }
//            resultLabel.text = resultLabel.text! + "."
//            print(result.text!)
        } else if sender.tag == 12 {
            self.appendNumberToScreen(number: "+")
//            print(result.text!)
        } else if sender.tag == 13 {
            self.appendNumberToScreen(number: "-")
//            print(result.text!)
        } else if sender.tag == 14 {
            if self.resultLabel.text != "0"
            {
                self.appendNumberToScreen(number: "*")
            }
            
//            print(result.text!)
        } else if sender.tag == 15 {
            if self.resultLabel.text != "0"
            {
                self.appendNumberToScreen(number: "/")
            }
//            print(result.text!)
        } else if sender.tag == 16 {
            if self.resultLabel.text != "0"
            {
                self.appendNumberToScreen(number: "%")
            }
//            print(result.text!)
//            self.handlePercentage()
        }
//
        
//        var newOperator = String()
//        switch sender.tag {
//        case 11:
//            newOperator = "."
//            if result.text == "0" {
//                self.result.text = result.text! + "0" + "."
//            }else {
//                self.result.text = result.text! + "."
//            }
//        case 12:
//            newOperator = "+"
//        case 13:
//            newOperator = "-"
//        case 14:
//            newOperator = "*"
//        case 15:
//            newOperator = "/"
//        case 16:
//            newOperator = "%"
//            self.result.text = result.text! + newOperator
//            handlePercentage()
//            return
//        default:
//            return
//        }
        
        
//        if let lastCharacter = result.text?.last, "+-*/".contains(lastCharacter) {
//            result.text = String(result.text!.dropLast()) + newOperator
//            multiplyButtonOutlet.isUserInteractionEnabled = true
//            divideButtonOutlet.isUserInteractionEnabled = true
//            plusButtonOutlet.isUserInteractionEnabled = true
//            minusButtonOutlet.isUserInteractionEnabled = true
//            commaButtonOutlet.isUserInteractionEnabled = true
//        } else {
//            // If last character is not an operator, append the new operator
//            result.text = (result.text ?? "") + newOperator
//            if ((result.text?.contains("+")) != nil) || ((result.text?.contains("-")) != nil) || result.text!.contains("x") || ((result.text?.contains("/")) != nil), let lastCharacters = result.text?.last, !"+-*/%".contains(lastCharacters){
//                multiplyButtonOutlet.isUserInteractionEnabled = false
//                divideButtonOutlet.isUserInteractionEnabled = false
//                plusButtonOutlet.isUserInteractionEnabled = false
//                minusButtonOutlet.isUserInteractionEnabled = false
//                commaButtonOutlet.isUserInteractionEnabled = false
//                }
//
//            }
                    
//        self.secondValue = true
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
      if keyPath == "text" {
//          print("old:", change?[.oldKey])
//          print("new:", change?[.newKey])
          let myValue = self.calculateExpression(expression: self.resultLabel.text!)
          self.lblFinalResult.text = myValue
      }
    }
    
    func formatNumber(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 5
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    func clearText() {
        self.resultLabel.text = "0"
        self.lblFinalResult.text = ""
    }
    
    func handlReverse() {
        
        if self.resultLabel.text != "0" {
            let newValue = self.resultLabel.text!.dropLast()
            self.resultLabel.text = String(newValue)
        
        }
    }
    
    func playTickSound() {
        
        guard let url = Bundle.main.url(forResource: "tick_sound", withExtension: "mp3") else {
            print("Error: Could not find tick sound file")
            return
        }
    
        do {
            // Initialize audio player
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            // Play the sound
            audioPlayer?.volume = 0.05
            audioPlayer?.play()
            // Add haptic feedback
                       let generator = UIImpactFeedbackGenerator(style: .light)
                       generator.impactOccurred()
        } catch {
            print("Error: Could not play tick sound")
        }
    }
    
    func blinkButton() {
         // Define the colors for blinking (white and original background color)
         let originalColor = btnEqual.backgroundColor
         let blinkColor = UIColor.white

         // Animate the button's background color to create blinking effect
         UIView.animate(withDuration: 0.03, animations: {
             self.btnEqual.backgroundColor = blinkColor
         }) { _ in
             UIView.animate(withDuration: 0.03, animations: {
                 self.btnEqual.backgroundColor = originalColor
             })
         }
     }
    
    private func addHistory() {
    
        let lastHistory = historyList.last
        let inputText = self.resultLabel.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        var resultText = ""
        if  self.lblFinalResult.text == ""{
            resultText = inputText
        }else{
            resultText = self.lblFinalResult.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        }
               
        if lastHistory?.input != resultText {
            let history = History(input: inputText, result: resultText)
            historyList.append(history)
            Utilities.shared.saveHistoryList(historyList)
            self.resultLabel.text = resultText
            self.lblFinalResult.text = ""
            self.tblHistory.reloadData()
            DispatchQueue.main.async {
                let lastRowIndex = self.historyList.count - 1 // Assuming yourDataArray is your data source
                let lastIndexPath = IndexPath(row: lastRowIndex, section: 0)
                self.tblHistory.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
            }
            
        }
        
        
        
    }
    
    private func appendNumberToScreen(number: String) {
        guard let currentText = self.resultLabel.text, !currentText.isEmpty else {
            self.resultLabel.text = number
            return
        }
        
        if currentText == NSLocalizedString("0", comment: "") {
            self.resultLabel.text = number
        } else {
            let lastChar = currentText.last
            if let lastChar = lastChar, "+-*/%.".contains(lastChar) {
                // Last character is an operator
                if lastChar == "*" && number.first == "%" {
                    // Allow % after *
                    self.resultLabel.text?.append(number)
                } else if !"+-*/%.".contains(number.first ?? Character("")) {
                    // Don't append the new number if it's an operator
                    self.resultLabel.text?.append(number)
                }
            } else {
                // Last character is not an operator, append the new number
                self.resultLabel.text?.append(number)
            }
        }
    }
    
    
    func calculate(expression: String) -> Double {
        var sanitizedExpression = expression.replacingOccurrences(of: "\\s", with: "", options: .regularExpression) // Remove white spaces
        
        var numbers = [Double]()
        var operators = [Character]()
        var currentNumber = ""
        var unaryMinus = false // Track unary negation
        
        for char in sanitizedExpression {
            if char.isNumber || char == "." {
                currentNumber += String(char)
            } else {
                if char == "-" && currentNumber.isEmpty && (numbers.isEmpty || (!operators.isEmpty && operators.last! == "+" || operators.last! == "-" || operators.last! == "*" || operators.last! == "/" || operators.last! == "%")) {
                    // Check if '-' should be treated as unary negation
                    unaryMinus = true
                } else if char == "+" && currentNumber.isEmpty && (numbers.isEmpty || (!operators.isEmpty && operators.last! == "+" || operators.last! == "-" || operators.last! == "*" || operators.last! == "/" || operators.last! == "%")) {
                    // Skip '+' if it's preceded by an operator
                    continue
                } else {
                    if !currentNumber.isEmpty {
                        numbers.append(unaryMinus ? -Double(currentNumber)! : Double(currentNumber)!)
                        currentNumber = ""
                    }
                    if char == "%" {
                        if !operators.isEmpty && operators.last! == "*" {
                            // Calculate percentage if '*' is the previous operator
                            let base = numbers.isEmpty ? 0.0 : numbers.removeLast()
                            let percentage = numbers.isEmpty ? 1.0 : numbers.removeLast()
                            numbers.append(base * (percentage / 100))
                        } else {
                            // Treat '%' as a regular operator
                            while !operators.isEmpty && precedence(operators.last!) >= precedence(char) {
                                let op = operators.removeLast()
                                let operand2 = numbers.removeLast()
                                let operand1 = numbers.removeLast()
                                numbers.append(applyOperator(operand1, operand2, op))
                            }
                            operators.append(char)
                        }
                    } else if "+-*/.".contains(char) {
                        // Handle other operators
                        while !operators.isEmpty && precedence(operators.last!) >= precedence(char) {
                            let op = operators.removeLast()
                            let operand2 = numbers.removeLast()
                            let operand1 = numbers.removeLast()
                            numbers.append(applyOperator(operand1, operand2, op))
                        }
                        operators.append(char)
                    }
                    unaryMinus = false // Reset unaryMinus flag
                }
            }
        }
        
        if !currentNumber.isEmpty {
            numbers.append(unaryMinus ? -Double(currentNumber)! : Double(currentNumber)!)
        }
        
        while !operators.isEmpty && numbers.count >= 2 {
            let op = operators.removeLast()
            let operand2 = numbers.removeLast()
            let operand1 = numbers.removeLast()
            numbers.append(applyOperator(operand1, operand2, op))
        }
        
        return numbers.isEmpty ? 0.0 : numbers.first!
    }


    private func precedence(_ operator: Character) -> Int {
        switch `operator` {
        case "+", "-":
            return 1
        case "*", "/":
            return 2
        case "%":
            return 3
        default:
            return 0
        }
    }

    private func applyOperator(_ operand1: Double, _ operand2: Double, _ operator: Character) -> Double {
        switch `operator` {
        case "+":
            return operand1 + operand2
        case "-":
            return operand1 - operand2
        case "*":
            return operand1 * operand2
        case "/":
            return operand1 / operand2
        case "%":
            return operand1.truncatingRemainder(dividingBy: operand2)
        default:
            fatalError("Unknown operator: r")
        }
    }
    
    func attributedStringWithTwoColors(text1: String, color1: UIColor, text2: String, color2: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        let attributedText1 = NSAttributedString(string: text1, attributes: [.foregroundColor: color1])
        attributedString.append(attributedText1)
        let attributedText2 = NSAttributedString(string: text2, attributes: [.foregroundColor: color2])
        attributedString.append(attributedText2)
        return attributedString
    }
    //for scientific calculator
    func removeNumberSeparator(_ expression: String, separator: Character = ",") -> String {
        return expression.replacingOccurrences(of: String(separator), with: "")
    }
    
    func addSeparator(_ string: String, separator: Character, isIndian: Bool) -> String {
        var decimalIndex = string.firstIndex(of: ".") ?? string.endIndex
        var str = string
        var temp = 0
        var mSwitch = true
        var i = str.index(before: decimalIndex)
        
        while i >= str.startIndex {
            temp += 1
            
            if mSwitch && temp % 3 == 0 {
                temp = 0
                mSwitch = !isIndian
                
                if i == str.index(after: str.startIndex) && (string[string.startIndex] == "-" || string[string.startIndex] == "\u{2212}") {
                    break
                }
                
                str.insert(separator, at: i)
            } else if !mSwitch && temp % 2 == 0 {
                temp = 0
                
                if i == str.index(after: str.startIndex) && (string[string.startIndex] == "-" || string[string.startIndex] == "\u{2212}") {
                    break
                }
                
                str.insert(separator, at: i)
            }
            
            if i == str.startIndex {
                break
            }
            
            i = str.index(before: i)
        }
        
        return str
    }
    
    func separateOutExpression(_ expression: String) -> [String] {
        var list = [String]()
        var temp = ""
        
        for char in expression {
            if char.isOperator() || char == "(" || char == ")" {
                if !temp.isEmpty {
                    list.append(temp)
                    temp = ""
                }
                list.append(String(char))
            } else {
                temp.append(char)
            }
        }
        
        if !temp.isEmpty {
            list.append(temp)
        }
        
        return list
    }
    
    func isNumber(_ string: String) -> Bool {
        return string.range(of: #"-?\d+(\.\d+(E\d+)?)?"#, options: .regularExpression) != nil
    }
    
    func formatNumber(_ x: Decimal, scale: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.minimumFractionDigits = scale
        formatter.minimumIntegerDigits = 1
        formatter.roundingMode = .halfUp
        
        return formatter.string(for: NSDecimalNumber(decimal: x)) ?? ""
    }
    
    func isExpressionBalanced(_ expression: String) -> Bool {
        var stack = [Character]()
        for char in expression {
            if char == "(" {
                stack.append(char)
            } else if char == ")" {
                if stack.isEmpty { return false }
                stack.popLast()
            }
        }
        return stack.isEmpty
    }

    func tryBalancingBrackets(_ expression: String) -> String {
        var exp = ""
        exp = expression
        var a = 0
        var b = 0

        if exp.last == "(" {
            while exp.last == "(" {
                exp.removeLast()
                if exp.isEmpty { return exp }
            }
        }

        var openBracketCount = 0
        var numOfPairs = 0

        for element in exp {
            if element == "(" {
                openBracketCount += 1
                a += 1
            } else if element == ")" {
                b += 1
                if openBracketCount > 0 {
                    openBracketCount -= 1
                    numOfPairs += 1
                }
            }
        }

        var reqOpen = b - numOfPairs
        var reqClose = a - numOfPairs
        while reqOpen > 0 {
            exp = "(\(exp)"
            reqOpen -= 1
        }
        while reqClose > 0 {
            exp = "\(exp))"
            reqClose -= 1
        }
        return exp
    }
    
    func canBeLastChar(_ char: Character) -> Bool {
        return char.isNumber || char.isRightUnaryOperator() || char == ")"
    }

    func solveExpression(_ expressionStack: inout [String], angleType:AngleType = AngleType.deg) throws -> String {
        var stack: [String]

        if expressionStack.contains("-") {
            stack = []
            while !expressionStack.isEmpty {
                if expressionStack.last == "-" {
                    expressionStack.removeLast()
                    let negValue = "-\(expressionStack.removeLast())"
                    stack.append(negValue)
                    continue
                }
                stack.append(expressionStack.removeLast())
            }
            stack.reverse()
        } else {
            stack = expressionStack
        }

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        // Solve trigonometric operators
        stack = try solveTrigonometricExpression(stack: &stack, angleType: angleType)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        // Solve left unary operators
        stack = try solveLeftUnary(stack: &stack)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        // Solve right unary operators
        stack = try solveRightUnary(stack: &stack)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        stack = solvePower(stack: &stack)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        stack = try solveDivision(&stack)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        stack = solveMultiplication(&stack)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        stack = solveAddition(stack)

        // Check if solved
        if stack.count == 1 { return stack.removeLast() }

        throw CalculationException(msg: CalculationMessage.invalidExpression)
    }

    func solveAddition(_ stack: [String]) -> [String] {
        var tempStack = [String]()
        var temp: String
        var stack = stack // Make the input stack mutable
//        while !stack.isEmpty {
//            temp = stack.removeLast()
//            if temp == "+" {
//                let precision = DecimalConstants.mathContext
//                let num1 = BigDecimalMath.toBigDecimal(tempStack.removeLast()) // Assuming BigDecimalMath.toBigDecimal returns a string
//                let num2 = BigDecimalMath.toBigDecimal(stack.removeLast()) // Assuming BigDecimalMath.toBigDecimal returns a string
//                let result = num1 + num2
//                tempStack.append(result)
//            } else {
//                tempStack.append(temp)
//            }
//        }
        
        while !stack.isEmpty {
            temp = stack.removeLast()
            if temp == "+" {
                // Convert strings to Decimal
                guard let num1 = Decimal(string: tempStack.removeLast()),
                      let num2 = Decimal(string: stack.removeLast()) else {
                    fatalError("Error: Unable to convert strings to Decimal")
                }
                // Perform multiplication
                let result = num1 + num2
                // Append the result back to the temporary stack as a string
                tempStack.append("\(result)")
            } else {
                tempStack.append(temp)
            }
        }
        
        return tempStack.reversed()
    }
    
//    func solveMultiplication(stack: inout [String]) -> [String] {
//        var tempStack = [String]()
//        var temp: String
//        while !stack.isEmpty {
//            temp = stack.removeLast()
//            if temp == "*" {
//                let precision = DecimalConstants.mathContext
//                let num1 = BigDecimalMath.toBigDecimal(tempStack.removeLast()) // Assuming BigDecimalMath.toBigDecimal returns a string
//                let num2 = BigDecimalMath.toBigDecimal(stack.removeLast()) // Assuming BigDecimalMath.toBigDecimal returns a string
//                let result = num1 * num2
//                tempStack.append(result)
//            } else {
//                tempStack.append(temp)
//            }
//        }
//        return tempStack.reversed()
//    }
    
    func solveMultiplication(_ stack: inout [String]) -> [String] {
        var tempStack = [String]()
        var temp: String
        while !stack.isEmpty {
            temp = stack.removeLast()
            if temp == "*" {
                // Convert strings to Decimal
                guard let num1 = Decimal(string: tempStack.removeLast()),
                      let num2 = Decimal(string: stack.removeLast()) else {
                    fatalError("Error: Unable to convert strings to Decimal")
                }
                // Perform multiplication
                let result = num1 * num2
                // Append the result back to the temporary stack as a string
                tempStack.append("\(result)")
            } else {
                tempStack.append(temp)
            }
        }
        return tempStack.reversed()
    }

//    func solveDivision(stack: inout [String]) throws -> [String] {
//        var tempStack = [String]()
//        var temp: String
//        while !stack.isEmpty {
//            temp = stack.removeLast()
//            if temp == "/" {
//                let precision = DecimalConstants.mathContext
//                let num1 = BigDecimalMath.toBigDecimal(tempStack.removeLast()) // Assuming BigDecimalMath.toBigDecimal returns a string
//                let num2 = BigDecimalMath.toBigDecimal(stack.removeLast()) // Assuming BigDecimalMath.toBigDecimal returns a string
//                if num2 == "0" {
//                    throw CalculationException(msg: CalculationMessage.divideByZero)
//                }
//                let result = num1 / num2
//                tempStack.append(result)
//            } else {
//                tempStack.append(temp)
//            }
//        }
//        
//        return tempStack.reversed()
//    }
    
    func solveDivision(_ stack: inout [String]) throws -> [String] {
        var tempStack = [String]()
        var temp: String
        while !stack.isEmpty {
            temp = stack.removeLast()
            if temp == "/" {
                // Convert strings to Decimal
                guard let num1 = Decimal(string: tempStack.removeLast()),
                      let num2 = Decimal(string: stack.removeLast()) else {
                    throw CalculationException(msg: CalculationMessage.invalidExpression)
                }
                if num2 == 0 {
                    throw CalculationException(msg: CalculationMessage.divideByZero)
                }
                // Perform division
                let result = num1 / num2
                // Append the result back to the temporary stack as a string
                tempStack.append("\(result)")
            } else {
                tempStack.append(temp)
            }
        }
        
        return tempStack.reversed()
    }
    
    func solveTrigonometricExpression(stack: inout [String], angleType: AngleType) throws -> [String] {
        var tempStack = [String]()
        let isDegree = angleType == AngleType.deg
        var temp: String
        
        while !stack.isEmpty {
            temp = stack.removeLast()
            switch temp {
            case "sin", "-sin":
                var num = Double(stack.removeLast()) ?? 0
                if !num.isFinite {
                    throw CalculationException(msg: .valueTooLarge)
                }
                if isDegree {
                    if num.truncatingRemainder(dividingBy: 180) == 0 {
                        tempStack.append("0.0")
                        continue
                    }
                    num = num.toRadians
                } else {
                    if num.truncatingRemainder(dividingBy: Double.pi) == 0 {
                        tempStack.append("0.0")
                        continue
                    }
                }
                num = sin(num)
                if temp == "-sin" {
                    num = -num
                }
                tempStack.append("\(num)")
                
            case "sinh", "-sinh":
                var num = Double(stack.removeLast()) ?? 0
                if !num.isFinite {
                    throw CalculationException(msg: .valueTooLarge)
                }
                if isDegree {
                    if num.truncatingRemainder(dividingBy: 180) == 0 {
                        tempStack.append("0.0")
                        continue
                    }
                    num = num.toRadians
                } else {
                    if num.truncatingRemainder(dividingBy: Double.pi) == 0 {
                        tempStack.append("0.0")
                        continue
                    }
                }
                num = sinh(num)
                if temp == "-sinh" {
                    num = -num
                }
                tempStack.append("\(num)")
                
            case "cos", "-cos":
                var num = Double(stack.removeLast()) ?? 0
                if !num.isFinite {
                    throw CalculationException(msg: .valueTooLarge)
                }
                if isDegree {
                    if num.truncatingRemainder(dividingBy: 90) == 0 && num.truncatingRemainder(dividingBy: 180) != 0 {
                        tempStack.append("0.0")
                        continue
                    }
                    num = num.toRadians
                } else {
                    if num.truncatingRemainder(dividingBy: Double.pi / 2) == 0 && num.truncatingRemainder(dividingBy: Double.pi) != 0 {
                        tempStack.append("0.0")
                        continue
                    }
                }
                num = cos(num)
                if temp == "-cos" {
                    num = -num
                }
                tempStack.append("\(num)")
                
            // Similar cases for other trigonometric functions...
                
            default:
                tempStack.append(temp)
            }
        }
        return tempStack.reversed()
    }

    func solveLeftUnary(stack: inout [String]) throws -> [String] {
        var tempStack = [String]()
        var temp: String
        
        while !stack.isEmpty {
            temp = stack.removeLast()
            switch temp {
            case "√", "-√", "∛", "-∛":
                var nextToken = stack.last ?? ""
                let num: String
                if  nextToken.first?.isLeftUnaryOperator() ?? false {
                    var gg = [String]()
                    while !stack.isEmpty &&  nextToken.first?.isLeftUnaryOperator() ?? false {
                        gg.append(stack.removeLast())
                        nextToken = stack.last ?? ""
                    }
                    if let solvedRoot = solveRoots(stack: &gg) {
                        if temp == "∛" || temp == "-∛" {
                            num = "\(cbrt(solvedRoot))"
                        } else {
                            num = "\(sqrt(solvedRoot))"
                        }
                    } else {
                        throw CalculationException(msg: .invalidExpression)
                    }
                } else {
                    if let number = Double(stack.removeLast()), number.isFinite {
                        if temp == "∛" || temp == "-∛" {
                            num = "\(cbrt(number))"
                        } else {
                            num = "\(sqrt(number))"
                        }
                    } else {
                        throw CalculationException(msg: .valueTooLarge)
                    }
                }
                if temp == "-√" || temp == "-∛" {
                    tempStack.append("-\(num)")
                } else {
                    tempStack.append(num)
                }
            default:
                tempStack.append(temp)
            }
        }
        return tempStack.reversed()
    }
    
    func solveRightUnary(stack: inout [String]) throws -> [String] {
        var tempStack = [String]()
        var temp: String
        
        while !stack.isEmpty {
            temp = stack.removeLast()
            switch temp {
            case "%":
                let precision = 20
                guard let num = Decimal(string: tempStack.removeLast()) else {
                    throw CalculationException(msg: .invalidExpression)
                }
                if tempStack.last == "+" && tempStack.count >= 2 {
                    _ = tempStack.removeLast() // Remove the "+"
                    var s = [String]()
                    while !tempStack.isEmpty {
                        s.append(tempStack.removeLast())
                    }
                    if let stepResult = Decimal(string: try solveExpression(&s)) {
                        let divided = num / Decimal(100)
                        let multiplied = divided * stepResult
                        tempStack.append((divided + multiplied).description)
                    } else {
                        throw CalculationException(msg: .invalidExpression)
                    }
                } else {
                    tempStack.append((num / Decimal(100)).description)
                }
            case "!":
                guard var number = Decimal(string: tempStack.removeLast()), number.isZero || number.isNormal else {
                    throw CalculationException(msg: .domainError)
                }
                let precision = 20
                var result: String
                if number.isSignMinus {
                    number = abs(number)
                    result = "-\(factorial(number, precision))"
                } else {
                    result = factorial(number, precision).description
                }
                tempStack.append(result)
            default:
                tempStack.append(temp)
            }
        }
        return tempStack.reversed()
    }

    func factorial(_ num: Decimal, _ precision: Int) -> Decimal {
        if num == 0 || num == 1 {
            return 1
        }
        var result: Decimal = 1
        for i in 2...Int(truncating: num as NSNumber) {
            result *= Decimal(i)
        }
        return result
    }
    
    func solvePower(stack: inout [String]) -> [String] {
        var tempStack = [String]()
        while !stack.isEmpty {
            let temp = stack.removeLast()
            if temp == "^" {
                let precision = 20
                guard let num1 = Decimal(string: tempStack.removeLast()),
                      let num2 = Decimal(string: stack.removeLast()) else {
                    continue
                }
                if num2 == 1 {
                    tempStack.append(num1.description)
                } else {
                    let result = pow((num1 as NSDecimalNumber) as Decimal, Int(num2 as NSDecimalNumber))
//                    let result = pow(num1, num2, precision)
                    tempStack.append(result.description)
                }
            } else {
                tempStack.append(temp)
            }
        }
        return tempStack.reversed()
    }

    func solveRoots(stack: inout [String]) -> Double? {
        guard var num = Double(stack.removeLast()) else { return 0 }
        while !stack.isEmpty {
            let kk = stack.removeLast()
            if kk == "√" {
                num = sqrt(num)
            }
            if kk == "∛" {
                num = cbrt(num)
            }
        }
        return num
    }

    func canPlaceDecimal(expression: String) -> Bool {
        var j = expression.index(before: expression.endIndex)
        var count = 0
        while j >= expression.startIndex && !expression[j].isOperator() {
            if expression[j] == "." {
                count += 1
                break
            }
            j = expression.index(before: j)
        }
        return count == 0
    }
    
    func prepareExpression(expression: String) -> String {
        if expression.isEmpty { return "" }
        var exp = expression

        // Remove number separator
        exp = removeNumberSeparator(exp)

        // Replace human readable operator characters with computer readable operator characters
        exp = exp.replacingOccurrences(of: "÷", with: "/")
                 .replacingOccurrences(of: "×", with: "*")
                 .replacingOccurrences(of: "+", with: "+")
                 .replacingOccurrences(of: "−", with: "-")
                 .replacingOccurrences(of: "²√", with: "√")

        // Replace constants with their values
        exp = exp.replacingOccurrences(of: "e", with: "\(M_E)")
            .replacingOccurrences(of: "π", with: "\(Double.pi)")

        exp = exp.replacingOccurrences(of: "-", with: "+-")

        // Corrective replace
        exp = exp.replacingOccurrences(of: "^+-", with: "^-")
                 .replacingOccurrences(of: "(+-", with: "(-")
//                 .replacingOccurrences(of: "+", with: "")
                 .replacingOccurrences(of: "/+", with: "/")
                 .replacingOccurrences(of: "++", with: "+")

        exp = exp.replacingOccurrences(of: "+)", with: ")")
                 .replacingOccurrences(of: "-)", with: ")")
                 .replacingOccurrences(of: "/)", with: ")")
                 .replacingOccurrences(of: "*)", with: ")")
                 .replacingOccurrences(of: ".)", with: ")")
                 .replacingOccurrences(of: "^)", with: ")")
                 .replacingOccurrences(of: "Rand", with: "\(Double.random(in: 0.0...100.0))")

        return exp
    }

    func getResult(expression: String, angleType: AngleType) throws -> String {
        if expression.isEmpty {
            return ""
        }
        var exp = ""
        exp = expression
//        var lastChar = exp.removeLast()

//        while !canBeLastChar(lastChar) {
//            exp = String(exp.dropLast())
//            if !exp.isEmpty {
//                lastChar = exp.last!
//            } else {
//                throw CalculationException(msg: CalculationMessage.invalidExpression)
//            }
//        }

        if exp.first == "+" || exp.first == "-" {
            exp = "0" + exp
        }

        var stack = [String]()
        var temp = ""
        for char in exp {
            if char.isNumber || char == "(" {
                if !temp.isEmpty {
                    stack.append(temp)
                    temp = ""
                }
                stack.append(String(char))
            } else if char == ")" {
                if !temp.isEmpty {
                    stack.append(temp)
                    temp = ""
                }
                var newStack = [String]()
                while !stack.isEmpty && stack.last != "(" {
                    newStack.append(stack.removeLast())
                }
                stack.removeLast()
                stack.append(try solveExpression(&newStack, angleType: angleType))
            } else {
                temp.append(char)
            }
        }
        if !temp.isEmpty {
            stack.append(temp)
        }
        stack.reverse()

        return try solveExpression(&stack, angleType: angleType)
    }

    func roundMyAnswer(ans: String, precision: Int = 6) throws -> String {
    
        if ans.isEmpty { return "" }
        do {
            guard let num = Decimal(string: ans) else {
                        throw CalculationException(msg: .invalidExpression)
            }
            if ans.contains("E") {
                return formatNumber(num, scale: 7)
            } else {
                let roundingMode: NSDecimalNumber.RoundingMode = .plain
                            let behavior = NSDecimalNumberHandler(roundingMode: roundingMode,
                                                                  scale: Int16(precision),
                                                                  raiseOnExactness: false,
                                                                  raiseOnOverflow: false,
                                                                  raiseOnUnderflow: false,
                                                                  raiseOnDivideByZero: false)
                            let roundedNum = (num as NSDecimalNumber).rounding(accordingToBehavior: behavior)
                            let trimmedNum = String(describing: roundedNum).trimmingCharacters(in: ["0"])
                if num.isEqual(to: 0) {
                    return "0"
                } else {
                    return trimmedNum
                }
            }
        } catch {
            throw CalculationException(msg: .invalidExpression)
        }
    }
    
    func calculateExpression(expression: String) -> String {
        var exp: String = ""
        if isExpressionBalanced(expression) {
            exp = prepareExpression(expression: expression)
        } else {
                exp = tryBalancingBrackets(expression)
            if isExpressionBalanced(exp) {
                exp = prepareExpression(expression: exp)
            } else {
                return "-1"
            }
        }
        
        do {
            let rawResult = try getResult(expression: exp, angleType: self.isRadMode ? AngleType.deg : AngleType.rad)
            let result = try roundMyAnswer(ans: rawResult)
            return rawResult
        } catch let error as CalculationException {
            let errorMessage: String
            switch error.msg {
                case CalculationMessage.invalidExpression:
                    errorMessage = NSLocalizedString("str_invalid", comment: "")
                case CalculationMessage.divideByZero:
                    errorMessage = NSLocalizedString("str_divide_by_zero", comment: "")
                case CalculationMessage.valueTooLarge:
                    errorMessage = NSLocalizedString("str_value_too_large", comment: "")
                case CalculationMessage.domainError:
                    errorMessage = NSLocalizedString("str_domain_error", comment: "")
            }
            return errorMessage
        } catch {
            return "Error"
        }
    }

    
    
}

extension Double {
    var toRadians: Double {
        return self * .pi / 180.0
    }
}

extension Character {
    func isNumber() -> Bool {
        return self.isNumber || self.isConstant()
    }

    func isOperator() -> Bool {
        return self.isUnaryOperator() || self.isBinaryOperator()
    }

    func isUnaryOperator() -> Bool {
        return self.isLeftUnaryOperator() || self.isRightUnaryOperator()
    }

    func isLeftUnaryOperator() -> Bool {
        let charSet: Set<Character> = ["√", "∛"]
        return charSet.contains(self)
    }

    func isRightUnaryOperator() -> Bool {
        let charSet: Set<Character> = ["%", "!"]
        return charSet.contains(self)
    }

    func isBinaryOperator() -> Bool {
        let charSet: Set<Character> = ["^", "-", "−", "+", "x", "*", "×", "/", "÷"]
        return charSet.contains(self)
    }

    func isConstant() -> Bool {
        return self.isPi() || self.isEulerNumber()
    }

    func isPi() -> Bool {
        return self == "π"
    }

    func isEulerNumber() -> Bool {
        return self == "e"
    }

    func isTrigonometricChar() -> Bool {
        let charSet: Set<Character> = ["¹", "⁻", "s", "i", "n", "c", "o", "t", "a", "l", "g"]
        return charSet.contains(self)
    }
}


extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.historyList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinalResultTableViewCell") as! FinalResultTableViewCell
        
        let history = self.historyList[indexPath.row]
        let text = history.input + "="
        let text2 = history.result
        let color = UIColor.darkGray
        let color2 = UIColor.white
        let attributedText = attributedStringWithTwoColors(text1: text, color1: color, text2: text2, color2: color2)
        cell.lblFinalResult.attributedText = attributedText
        return cell
    }

    
}
struct History: Codable{
    let input: String
    let result: String
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
