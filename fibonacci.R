# Generate first 10 Fibonacci numbers
fib_seq <- c(0, 1)
for (i in 3:10) {
  fib_seq <- c(fib_seq, fib_seq[i-1] + fib_seq[i-2])
}
print(fib_seq)