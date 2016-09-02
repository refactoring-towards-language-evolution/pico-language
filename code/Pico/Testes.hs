module Pico.Testes where

import Pico.Syntax
import Pico.Interpreter

import Test.HUnit

st :: SymbolTable
st = [("x", TNatural), ("y", TNatural), ("output", TNatural)]

testSuite = TestList [ 
  TestLabel "sumTest" sumTest, 
  TestLabel "subTest" subTest,
  TestLabel "ifThenTest" ifThenTest,
  TestLabel "ifThenElseTest1" ifThenElseTest1,
  TestLabel "ifThenElseTest2" ifThenElseTest2 ]

-- | Variables for sum and sub tests
x10 :: Statement
x10 = Assignment "x" (ExpValue (NATValue 10))

y50 :: Statement
y50 = Assignment "y" (ExpValue (NATValue 50))

-- | Simple sum statement test
sumProgram :: Program
sumProgram = Program st [x10, y50, res1]

res1 :: Statement
res1 = Assignment "output" (Add (Var "x") (Var "y"))

sumTest = TestCase (assertEqual "for x = 10; y = 50; output = x + y;" (NATValue 60) (runProgram sumProgram)) 

-- | Simple subtraction statement test
subProgram :: Program
subProgram = Program st [x10, y50, res2] 

res2 :: Statement
res2 = Assignment "output" (Sub (Var "y") (Var "x"))

subTest = TestCase (assertEqual "for x = 10; y = 50; output = y - x;" (NATValue 40) (runProgram subProgram))

-- | Simple ifThen statement test
ifThenProgram :: Program
ifThenProgram = Program st [out10, ifBlock]

out10 :: Statement
out10 = Assignment "output" (ExpValue (NATValue 10))

ifBlock :: Statement
ifBlock = IfThen ifExp ifBody

ifExp :: Expression
ifExp = (ExpValue (NATValue 1))

ifBody :: Statement
ifBody = Assignment "output" (ExpValue (NATValue 20))

ifThenTest = TestCase (assertEqual "for output = 10; if(1){ output = 20 }" (NATValue 20) (runProgram ifThenProgram)) 

-- | Simple ifThenElse statement test
ifThenElseProgram1 :: Program
ifThenElseProgram1 = Program st [ifElseBlock1]

ifElseBlock1 :: Statement
ifElseBlock1 = IfThenElse trueExp statement1 statement2

trueExp :: Expression
trueExp = (ExpValue (NATValue 1))

ifThenElseProgram2 :: Program
ifThenElseProgram2 = Program st [ifElseBlock2]

ifElseBlock2 :: Statement
ifElseBlock2 = IfThenElse falseExp statement1 statement2

falseExp :: Expression
falseExp = (ExpValue (NATValue 0))

statement1 :: Statement
statement1 = Assignment "output" (ExpValue (NATValue 1))

statement2 :: Statement
statement2 = Assignment "output" (ExpValue (NATValue 2))

ifThenElseTest1 = TestCase (assertEqual "if(1){output = 1} else {output = 2}" 
                             (NATValue 1) (runProgram ifThenElseProgram1)) 
ifThenElseTest2 = TestCase (assertEqual "if(0){output = 1} else {output = 2}" 
                             (NATValue 2) (runProgram ifThenElseProgram2)) 
