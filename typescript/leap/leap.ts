function divisibleBy(year: number, duration: number) : boolean {
  return year % duration === 0
}

export function isLeap(year: number) : boolean {

  if (divisibleBy(year, 400)) return true
  if (divisibleBy(year, 100) && !(divisibleBy(year, 400))) return false
  return divisibleBy(year, 4)
}
