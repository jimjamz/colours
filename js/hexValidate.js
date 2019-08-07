function isValidHex(text_input) {
    var myElement = document.querySelector("#submit");
    var isOk  =  /(^[0-9A-F]{6}$)|(^[0-9A-F]{3}$)/i.test(text_input.value);
    if(isOk)
    {
      myElement.style.display = "inline";
      alert(yes);
      return false;
    }
    else
    {
      alert('Invalid hexadecimal data.  Try again.');
      myElement.style.display = "none";
      return true;
    }
  }