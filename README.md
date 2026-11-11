# Java Beginner Projects

[![CI](https://github.com/DanyilShkodiuk/java-projects/actions/workflows/ci.yml/badge.svg)](https://github.com/DanyilShkodiuk/java-projects/actions/workflows/ci.yml)

Eight small console programs I wrote while learning Java fundamentals: input with `Scanner`, arithmetic, conditionals, loops, `switch` expressions, `Math` and `Random`.

| Program | What it does | Concepts |
|---|---|---|
| [BasicCalculator](Projects/src/BasicCalculator.java) | `+ - * / ^` on two numbers, with divide-by-zero check | `switch` expressions, `Math.pow` |
| [CalcAreaOfRectangle](Projects/src/CalcAreaOfRectangle.java) | Area of a rectangle from width and height | input, arithmetic |
| [CompoundInterestCalculator](Projects/src/CompoundInterestCalculator.java) | Final amount for a principal, rate, compounding frequency and years | formulas, `printf` formatting |
| [MadLibsGame](Projects/src/MadLibsGame.java) | Builds a short story from words you type | strings, `nextLine` |
| [NumberGuessingGame](Projects/src/NumberGuessingGame.java) | Guess a random number 1–100 with "too high / too low" hints and an attempt counter | `Random`, `do-while` loop |
| [ShoppingCartProgram](Projects/src/ShoppingCartProgram.java) | Total price for an item and quantity | mixed input types |
| [TemperatureConverter](Projects/src/TemperatureConverter.java) | Celsius ↔ Fahrenheit | ternary operator |
| [WeightConverter](Projects/src/WeightConverter.java) | Kilograms ↔ pounds | `if / else if` menus |

## Run

Requires JDK 17 or newer.

```bash
cd Projects
javac -d out src/*.java
java -cp out NumberGuessingGame   # or any other program name from the table
```

Or open the `Projects` folder in IntelliJ IDEA and run any class.

## Tests

[`smoke-test.sh`](smoke-test.sh) runs every program with sample input and checks its output (for example, that 100 °F converts to 212 °F and back). GitHub Actions compiles everything and runs it on each push and pull request.

```bash
javac -d out Projects/src/*.java
bash smoke-test.sh out
```

For a larger, structured version of the calculator see [java-calculator](https://github.com/DanyilShkodiuk/java-calculator).
