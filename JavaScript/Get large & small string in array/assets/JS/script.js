var displayBlock = "block";
var displayNone = "none";
var strongError = "<strong>Error!</strong>";
var strongSuccess = "<strong>Success!</strong>";
function findSmallestAndLargest() {
     var validationError= document.getElementById("validationError");
     var ResultGetByElement= document.getElementById("result");
     validationError.style.display =  displayNone;
     ResultGetByElement.style.display = displayNone;
     ResultGetByElement.innerHTML = '';
     validationError.innerHTML = '';
     var input = document.getElementById("inputField").value.trim().replace(/\s\s+/g, ' ');
     var splitResult = input.split(" ");
     if (input !== null && input !== "") {
          if (!(/^[a-zA-Z0-9 ]*$/.test(input))) {
               var specialCharacterValidation = strongError + " Special Character(s) not allowed";
               validationError.innerHTML += specialCharacterValidation;
               validationError.style.display = displayBlock;
          }
          else if (splitResult.length === 1) {
               var oneWordValidation = strongError + " Please enter a sentence which has more than one word";
               validationError.style.display = displayBlock;
               validationError.innerHTML += oneWordValidation;
          }
          else if (splitResult[0].length === splitResult[splitResult.length - 1].length) {
               var wordValidation = strongError + " All words are equal in length";
               validationError.innerHTML += wordValidation;
               validationError.style.display = displayBlock;
          }
          else {
               for(var i=0;i<splitResult.length;i++){
                    for(var j=i+1;j<splitResult.length;j++){
                         if(splitResult[i].length>splitResult[j].length){
                              var temp = splitResult[i];
                              splitResult[i]=splitResult[j];
                              splitResult[j]=temp;
                         }
                    }
               }
               var lastElement = splitResult[splitResult.length - 1];
               ResultGetByElement .innerHTML += strongSuccess + "<ul><li>The Minimum value is " + splitResult[0] + "</li>" + "<li>The Maximum value is " + lastElement + "</li></ul>";
               ResultGetByElement.style.display = displayBlock;
          }
     }
     else {
          var errorMessage = strongError + " Please enter a sentence";
          validationError.innerHTML += errorMessage;
          validationError.style.display = displayBlock;
     }
}
function reset() {
     var validationError= document.getElementById("validationError");
     var ResultGetByElement= document.getElementById("result");
     var displayNone = "none";
     document.getElementById("inputField").value = '';
     validationError.innerHTML = '';
     ResultGetByElement.innerHTML = '';
     validationError.style.display = displayNone;
     ResultGetByElement.style.display = displayNone;
}
