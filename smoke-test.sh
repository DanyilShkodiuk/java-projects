#!/usr/bin/env bash
# Runs each program with sample input and checks one line of its output.
# Usage: bash smoke-test.sh <compiled-classes-dir>
set -euo pipefail
classes="${1:-out}"
failed=0

check() {
  local program="$1" input="$2" expected="$3"
  local actual
  actual="$(printf "$input" | java -cp "$classes" "$program" 2>&1)"
  if [[ "$actual" == *"$expected"* ]]; then
    echo "ok   $program"
  else
    echo "FAIL $program: expected \"$expected\""
    echo "$actual" | sed 's/^/     /'
    failed=1
  fi
}

check BasicCalculator             '2\n^\n10\n'          '1024.0'
check CalcAreaOfRectangle         '3\n4\n'              '12.0 cm^2'
check CompoundInterestCalculator  '1000\n10\n1\n2\n'    '$1210.00'
check MadLibsGame                 'big\ncat\nfunny\nrunning\nhappy\n' 'cat was funny and running!'
check ShoppingCartProgram         'apple\n0.5\n4\n'     'Your total is: $2.0'
check TemperatureConverter        '100\nF\n'            '212.0 F'
check TemperatureConverter        '212\nC\n'            '100.0 C'
check WeightConverter             '2\n10\n'             '22.05'
check NumberGuessingGame          "$(seq 1 100 | tr '\n' ' ')\n" 'CORRECT!'

exit "$failed"
