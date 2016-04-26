
var i = 0;
var path = new Array();

path[0] = "../images/quotegamer/firststarting_bear.gif";  //Working fine
path[1] = "../images/quotegamer/performwell1.gif";       // Working fine
path[2] = "../images/quotegamer/secondstarting_bear.gif"; // working fine (small issue with the height)

path[3] = "../images/quotegamer/Bear_emotion11.gif"; // Working fine
path[4] = "../images/quotegamer/bear_emotion12.gif"; // working fine
path[5] = "../images/quotegamer/bear_sademotion6.gif"; // working fine



function swapImage()
{
document.slide.src = path[i];
if(i < path.length - 1) i++; else i = 0;

// setTimeout("swapImage()",3500); 
}

function start123()
{
swal({   title: "Quiz",  
text: "The Quiz will Begin in 5 Seconds Get Ready", timer: 5000,   
showConfirmButton: false });
}

/*
alert("Hello Welcome to the Gamified Platform");
alert("All The Best");
*/
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

jQuery(function ($) {
    var fiveMinutes = 60 * 5,
        display = $('#time');
    startTimer(fiveMinutes, display);
});


function posQuote()
{
	

var quote = [
    "You are right",
    "You are Awesome",
    "Good Going",
    "Doing Well",
    "You can do it",
    "Don't Stop when you are TIRED", 
    "Stop when you are DONE"
];

var quote1 = [
    "You can do it",
    "Don't Stop when you are TIRED", 
    "Stop when you are DONE"
];

var quote2 = [
"Don't Give up", 
"Always Be Positive"
];

var quote3 = [
"You only fail when you stop trying",
"The Struggle you're in today is developing the strength you need for tomorrow"];

var randomIndex = Math.floor(Math.random() * quote.length); 
var first = quote[randomIndex];

var randomIndex1 = Math.floor(Math.random() * quote1.length); 
var second = quote1[randomIndex1];

var randomIndex2 = Math.floor(Math.random() * quote2.length); 
var third = quote2[randomIndex2];

var randomIndex3 = Math.floor(Math.random() * quote3.length); 
var fourth = quote3[randomIndex3];


document.getElementById("quotetext").innerHTML = first ;

}

function negQuote() 
{
    var quote2 = [
"Don't Give up", 
"Always Be Positive"
];

var quote3 = [
"You only fail when you stop trying",
"The Struggle you're in today is developing the strength you need for tomorrow",
"Don't Give up", 
"Always Be Positive"];

var randomIndex2 = Math.floor(Math.random() * quote2.length); 
var third = quote2[randomIndex2];

var randomIndex3 = Math.floor(Math.random() * quote3.length); 
var fourth = quote3[randomIndex3];
    
    document.getElementById("quotetext").innerHTML = fourth ;
    
}






