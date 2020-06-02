// ensure only valid hexadecimal is used
function isValidHex(text_input) {
    // get the form submit button element
    var mySubmitButton = document.querySelector("#submit");
    // test the value in the input field to see if it contains only hexademical characters
    var isOk  =  /(^[0-9A-F]{6}$)|(^[0-9A-F]{3}$)/i.test(text_input.value);
    if(isOk)
    {
      // display the submit button via CSS     
      mySubmitButton.style.display = "inline";
      alert(yes);
      return false;
    }
    else
    {
      alert('Invalid hexadecimal data.  Try again.');
      // hide the submit button via CSS
      mySubmitButton.style.display = "none";
      return true;
    }
  }

// disable the ENTER key so invalid hex values cannot be submitted
function disableEnterKey(key_input) {
  // if the ENTER key is pressed
  if (key_input.keyCode == 13) {
    // prevent the event from happening
    return false;
  }
}
document.onkeypress = disableEnterKey;