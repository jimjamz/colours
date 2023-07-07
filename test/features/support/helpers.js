  function scan(str, regex) {
    if (!regex.global) {
      throw new Error("A regex without the global (/g) flag is not supported.");
    }
    var result = [];
    var m;
    while (m = regex.exec(str)) {
        if (m.length >= 2) {
            result.push(m.slice(1));
        } else {
            result.push(m[0]);
        }
    }
    return result;
  }

  function hex2rgb(in_hex) {
    // if the input is 3-digit hexadecimal notation
    if (in_hex.length < 6) {
      // expand to a 6-digit hexadecimal
      let s = [];
      // split the string by each character and for each ...
      in_hex.split('').forEach(function(x) {
        // ... push it twice onto the new array
        s.push(x, x);
      })
      in_hex = s.join('');
    }
    // convert each of the 3 hexadecimal pairs into a denary integer
    // no scan method in Javascript like Ruby. Crafted my own.
    let t = scan(in_hex, /../g).map(x => parseInt(x, 16));
    // needs to be a string literal here, not a regex
    // because the 3 hexadecimal pairs need to be interpolated.
    const out_rgb = `rgba?\\(${t[0]}, ${t[1]}, ${t[2]}(, 1)?\\)`;
    return out_rgb;
  }
  
module.exports = {
  hex2rgb
}