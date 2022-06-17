
func test(s: String) {
    /*let ns = NSString(string: s)
    let nms = NSString(string: s)
 
    print("'\(s)'")
    print("count \(s.count) length \(ns.length)")
    print("utf8.count \(s.utf8.count) utf16.count \(s.utf16.count) unicodeScalars.count \(s.unicodeScalars.count)")

    // --- constructing a String.Index from integer ---

    let ix1 = String.Index(encodedOffset: s.count) // GOOD
    let ix2 = String.Index(encodedOffset: ns.length) // BAD: NSString length used in String.Index
    let ix3 = String.Index(encodedOffset: s.utf8.count) // BAD: String.utf8 length used in String.Index
    let ix4 = String.Index(encodedOffset: s.utf16.count) // BAD: String.utf16 length used in String.Index
    let ix5 = String.Index(encodedOffset: s.unicodeScalars.count) // BAD: string.unicodeScalars length used in String.Index
    print("String.Index '\(ix1.encodedOffset)' / '\(ix2.encodedOffset)' '\(ix3.encodedOffset)' '\(ix4.encodedOffset)' '\(ix5.encodedOffset)'")

    let ix6 = s.index(s.startIndex, offsetBy: s.count / 2) // GOOD
    let ix7 = s.index(s.startIndex, offsetBy: ns.length / 2) // BAD: NSString length used in String.Index
    print("index '\(ix6.encodedOffset)' / '\(ix7.encodedOffset)'")

    var ix8 = s.startIndex
    s.formIndex(&ix8, offsetBy: s.count / 2) // GOOD
    var ix9 = s.startIndex
    s.formIndex(&ix9, offsetBy: ns.length / 2) // BAD: NSString length used in String.Index
    print("formIndex '\(ix8.encodedOffset)' / '\(ix9.encodedOffset)'")

    // --- constructing an NSRange from integers ---

    let range1 = NSMakeRange(0, ns.length) // GOOD
    let range2 = NSMakeRange(0, s.count) // BAD: String length used in NSMakeRange
    let range3 = NSMakeRange(0, s.reversed().count) // BAD: String length used in NSMakeRange
    let range4 = NSMakeRange(0, s.distance(from: s.startIndex, to: s.endIndex))  // BAD: String length used in NSMakeRange
    print("NSMakeRange '\(range1.description)' / '\(range2.description)' '\(range3.description)' '\(range4.description)'")

    let range5 = NSRange(location: 0, length: ns.length) // GOOD
    let range6 = NSRange(location: 0, length: s.count) // BAD: String length used in NSMakeRange
    print("NSRange '\(range5.description)' / '\(range6.description)'")

    // --- String operations using an integer directly ---

    let str1 = s.dropFirst(s.count - 1) // GOOD
    let str2 = s.dropFirst(ns.length - 1) // BAD: NSString length used in String
    print("dropFirst '\(str1)' / '\(str2)'")

    let str3 = s.dropLast(s.count - 1) // GOOD
    let str4 = s.dropLast(ns.length - 1) // BAD: NSString length used in String
    print("dropLast '\(str3)' / '\(str4)'")

    let str5 = s.prefix(s.count - 1) // GOOD
    let str6 = s.prefix(ns.length - 1) // BAD: NSString length used in String
    print("prefix '\(str5)' / '\(str6)'")

    let str7 = s.suffix(s.count - 1) // GOOD
    let str8 = s.suffix(ns.length - 1) // BAD: NSString length used in String
    print("suffix '\(str7)' / '\(str8)'")

    let nstr1 = ns.character(at: ns.length - 1) // GOOD
    let nmstr1 = nms.character(at: nms.length - 1) // GOOD
    let nstr2 = ns.character(at: s.count - 1) // BAD: String length used in NString
    let nmstr2 = nms.character(at: s.count - 1) // BAD: String length used in NString
    print("character '\(nstr1)' '\(nmstr1)' / '\(nstr2)' '\(nmstr2)'")

    let nstr3 = ns.substring(from: ns.length - 1) // GOOD
    let nmstr3 = nms.substring(from: nms.length - 1) // GOOD
    let nstr4 = ns.substring(from: s.count - 1) // BAD: String length used in NString
    let nmstr4 = nms.substring(from: s.count - 1) // BAD: String length used in NString
    print("substring from '\(nstr3)' '\(nmstr3)' / '\(nstr4)' '\(nmstr4)'")

    let nstr5 = ns.substring(to: ns.length - 1) // GOOD
    let nmstr5 = nms.substring(to: nms.length - 1) // GOOD
    let nstr6 = ns.substring(to: s.count - 1) // BAD: String length used in NString
    let nmstr6 = nms.substring(to: s.count - 1) // BAD: String length used in NString
    print("substring to '\(nstr5)' '\(nmstr5)' / '\(nstr6)' '\(nmstr6)'")

    let nmstr7 = NSMutableString(string: s)
    nmstr7.insert("*", at: nms.length - 1) // GOOD
    let nmstr8 = NSMutableString(string: s)
    nmstr8.insert("*", at: s.count - 1) // BAD: String length used in NString
    print("insert '\(nmstr7)' / '\(nmstr8)'")*/
}

// `begin :thumbsup: end`, with thumbs up emoji and skin tone modifier
test(s: "begin \u{0001F44D}\u{0001F3FF} end")
