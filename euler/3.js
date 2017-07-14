const primeFactors = num => {
  const factors = new Set()
  for (let i = 2; i < num; i++) {
    while (num % i === 0) {
      num /=  i
      factors.add(i)
    }
  }
  // last number is
  factors.add(num)

  return Array.from(factors)
}

console.log(primeFactors(13195))
