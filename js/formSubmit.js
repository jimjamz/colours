window.onload = function processForm()
{
  // find the list of parameters within the URL
  // from the list of URL parameters submitted in the form, 
  // extract the first parameter before the second starts (&)
  var url_parameters = location.search.substring(1).split("&");
  // extract only the parameter value
  var param_value = url_parameters[0].split("=");
  // format the parameter value to text
  colour_value = decodeURI(param_value[1]);
  // assign the parameter value as an HTML element
  document.getElementById('html_custom_colour').innerHTML = colour_value.toString();
  // assign the parameter value to a CSS variable in styles.css
  var html = document.getElementsByTagName('html')[0];
  html.style.cssText = "--custom-colour: #" + colour_value;
}
processForm();