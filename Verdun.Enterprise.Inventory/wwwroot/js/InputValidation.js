/**
 * This functions are used in the partial CREATE/Edit views to validate number field, checkbox
 * Included in the layout view so availabe for all the pages. Use type=number for html5.
 * By Jim Chen on 08/21/2020
 */
function isNumberKey(elem) {
    //console.log('--event:' + event + ', ***elem:' + elem.value);
    //The input element is passed in. 
    //If type = "number"(HTML5.0), browser prevents non-digit value into Input Element so elem.value is blank.
    //Else this code will do the same thing if the browser doesn't support HTML5.
    if (jQuery.isNumeric(elem.value) == false) {
        alert('This is a number field so input only numbers please.')
        elem.value = '';        //remove the value
        return false;
    }
    return true;
    //You may use the keyboard event to judge
    //console.log('--event type:' + event.type + ', key code:' + event.code + ', key:'+ event.key);    
}

//other way to call a function
$(document).on("click", "[type='checkbox']", function (e) {    
    if (this.checked) {
        $(this).attr("value", "true");
    } else {
        $(this).attr("value", "false");
    }
    //console.log('--checkbox clicked:' + $(this).val());
});
