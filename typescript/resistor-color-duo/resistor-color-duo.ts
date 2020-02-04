export class ResistorColor {
  private bands: string[] = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
  readonly maxLength = 2;

  constructor(private colors: string[]) {
    if (colors.length < this.maxLength) {
      throw("At least two colors need to be present")
    }
    this.colors = colors;
  }

  value = (): number => {
    let arr = [0, 1]
    let reducer = (acc: string, current: number) => acc += this.bands.indexOf(this.colors[current])
    return Number.parseInt(arr.reduce(reducer, ""), 10)
  }
}
