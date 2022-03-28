let addColourForm = document.getElementById("add_colour_form");
let addColourInput = document.getElementById("add_colour_input");
let addColourList = document.getElementById("colour_list");

addColourForm.addEventListener("click", () => {
    console.log("A colour is about to be entered.");
})
addColourForm.addEventListener("submit", (e) => {
    // prevents standard submit POST form behaviour 
    e.preventDefault(); 
    alert(`${addColourInput.value} was added to the list.`);
    addColour(addColourInput.value);
})

function addColour(colour) {
    // appends the bullet point and button with the input value
    addColourList.insertAdjacentHTML("beforeend", `<li>${colour} <button onclick="deleteColour(this)">delete</button></li>`);
    // clear the input field once used
    addColourInput.value = "";
    // retains the typing caret in the input field
    // to quickly enter another colour
    addColourInput.focus();
}
function deleteColour(elementToDelete) {
    // gets the parent element (<ul>) as well as the passed element object (<button>)
    selectedColour = elementToDelete.parentElement
    // gets only the text from the parent element (the colour)
    // and not the text from the child element ('button')
    .childNodes[0].nodeValue
    // removes trailing whitespace left after getting the text
    .trim();
    alert(`${selectedColour} was deleted from the list.`);
    elementToDelete.parentElement.remove();
}