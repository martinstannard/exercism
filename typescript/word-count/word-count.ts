class Words {
    public count( words:string): Map<string, number> {
        const arr: string[] = words.split(/(\s+)/)
        const m = new Map
        for(let word of arr) {
            Words.count_word(m, word.toLowerCase())
        }
        return m
    }

    static count_word(map: Map<string, number>, word:string): void {
        if (word.length == 0) return
        if (word.match(/(\s+)/)) return
        let count = map.get(word) || 0
        map.set(word, count + 1)
    }
}

export default Words
