class ReverseString {
  static reverse( str: string): string {
    let target = ""
    for(let i = 0; i < str.length; i++) {
      target = str[i] + target
    }
    return target
  }
}

export default ReverseString
