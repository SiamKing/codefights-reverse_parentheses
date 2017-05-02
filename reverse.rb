def reverseParentheses(s)
    i = 0
    s = s.split('')
    a = [].replace(s)

    o_indexes = []
    c_indexes = []
    s.each.with_index {|c, i| o_indexes.push(i) if c == '('}
    o_indexes.reverse!

    while i < o_indexes.length
        j = o_indexes[i]
        until a[j] == ')'
            j += 1
        end
        a.slice!(j)
        c_indexes.push(j + i)
        i += 1
    end

    i = 0

    while i < o_indexes.length
        arr = s.slice!(o_indexes[i], c_indexes[i] - o_indexes[i] - i)
        arr.delete('(')
        arr.delete(')')
        arr.each {|c| s.insert(o_indexes[i] + 1, c)}
        i += 1
    end

    s.delete("(")
    s.delete(")")
    s.join('')
end
