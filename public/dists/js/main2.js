$(document).ready(function($) {
    //check if the .cd-image-container is in the viewport 
    //if yes, animate it
    sunResizer();
    checkPosition($('.cd-image-container'));
    $(window).on('scroll', function() {
        checkPosition($('.cd-image-container'));
    });

    //make the .cd-handle element draggable and modify .cd-resize-img width according to its position
    $('.cd-image-container').each(function() {
        var actual = $(this);
        drags(actual.find('.cd-handle'), actual.find('.cd-resize-img'), actual);
    });

    //upadate images label visibility
    $(window).on('resize', function() {
        $('.cd-image-container').each(function() {
            var actual = $(this);
        });
    });
});

function checkPosition(container) {
    container.each(function() {
        var actualContainer = $(this);
        if ($(window).scrollTop() + $(window).height() * 0.5 > actualContainer.offset().top) {
            actualContainer.addClass('is-visible');
        }
    });
}

$(window).resize(function() {
    sunResizer();
});

function sunResizer() {
    $(".cd-handle").css('background-size', ($('#original').width() * 0.1));
    //console.log('xPos: ' + $('#original').position().left);
    //console.log('yPos: ' + $('#original').position().top);
    //console.log('xPosOff: ' + $('#original').offset().left);
    //console.log('yPosOff: ' + $('#original').offset().top);
}

var currentVal = 0,
    leftValue = 0,
    minLeft = 0,
    currentVal = 0,
    dragWidth = 0,
    containerOffset = 0,
    containerWidth = 0,
    maxLeft = 0,
    widthValue = 0
currentValPer = 0,
    destinationValPer = 0;

function drags(dragElement, resizeElement, container) {
    $(document).ready(function(e) {
        resizeElement.addClass('resizable');

        //dragWidth = dragElement.outerWidth() - (dragElement.outerWidth() * 0.40);
        dragWidth = dragElement.outerWidth();
        //containerOffset = container.offset().left;
        containerWidth = container.outerWidth();
        minLeft = container.offset().left;
        //maxLeft = containerOffset + containerWidth - dragWidth + (dragElement.outerWidth() * 0.05);
        maxLeft = minLeft + containerWidth;
        //console.log("maxLeft" + maxLeft);

        switch (e.which) {
            case 37: // left
                //incrementLeft(10);
                console.log('left');
                incrementLeftPer(10);
                break;

            case 39: // right
                //incrementRight(10);
                console.log('right');
                incrementRightPer(100);
                break;

            default:
                return;
        }
        e.preventDefault();
    })
}

function incrementLeft(byVal) {
    currentValPer = (currentVal / (maxLeft - minLeft)) * 100;
    destinationValPer = (currentVal + byVal / (maxLeft - minLeft)) * 100;
    leftValue = minLeft + currentVal - byVal;
    //console.log("minLeft: " + minLeft);
    //console.log("currentVal: " + currentVal);
    //console.log("minLeft + currentVal>: " + (minLeft + currentVal));
    //console.log($('#original').width());
    slider();
}

function incrementRight(byVal) {
    currentValPer = (currentVal / (maxLeft - minLeft)) * 100;
    destinationValPer = (currentVal + byVal / (maxLeft - minLeft)) * 100;
    leftValue = minLeft + currentVal + byVal;
    //console.log("minLeft: " + minLeft);
    //console.log("currentVal: " + currentVal);
    //console.log("minLeft + currentVal: " + (minLeft + currentVal));
    //console.log($('#original').width());
    slider();
}

function incrementLeftPer(byPer) {
    currentValPer = (currentVal / (maxLeft - minLeft)) * 100;
    destinationValPer = ((currentVal - (byPer * ((maxLeft - minLeft)) / 100)) / (maxLeft - minLeft)) * 100;
    leftValue = minLeft + currentVal - (byPer * ((maxLeft - minLeft)) / 100);
    console.log("yay");
    //console.log("current Val Per: " + currentValPer);
    //console.log("destination val per: " + destinationValPer);
    slider();
}

function incrementRightPer(byPer) {
    currentValPer = (currentVal / (maxLeft - minLeft)) * 100;
    destinationValPer = ((currentVal + (byPer * ((maxLeft - minLeft)) / 100)) / (maxLeft - minLeft)) * 100;
    leftValue = minLeft + currentVal + (byPer * ((maxLeft - minLeft)) / 100);
    console.log("yaya");
    //console.log("current Val Per: " + currentValPer);
    //console.log("destination val per: " + destinationValPer);
    slider();
}

function slider() {
    console.log("yaya1");
    if (leftValue < minLeft) {
        leftValue = minLeft;
    }
    else if (leftValue > maxLeft) {
        leftValue = maxLeft;
    }

    currentVal = leftValue - minLeft;
    widthValue = (currentVal / (maxLeft - minLeft)) * 100 + '%';

    //widthValue = currentValPer + "%";
    //setWidthVal();
    //console.log("currentVal: " + currentVal);
    //console.log("dragwidth: " + dragWidth);
    //console.log("containerWidth: "+ containerWidth);
    //console.log("widthValue: " + widthValue);

    sunMover();
}

function sunMover() {

    console.log("yaya2");

    var lVal = map(((currentVal) / (maxLeft - minLeft)) * 100, 0, 100, 10, 90) + '%';
    //var lVal = map(currentValPer, 0, 100, 10, 90) + '%';
    var tVal = 0;
    $('.cd-handle').css('left', lVal);
    if (currentVal + minLeft < (minLeft + maxLeft) / 2) {
        tVal = map(currentVal + minLeft, minLeft, (minLeft + maxLeft) / 2, 50, 10) + '%';
        $('.cd-handle').css('top', tVal);
    }
    else {
        tVal = map(currentVal + minLeft, (minLeft + maxLeft) / 2, maxLeft, 10, 50) + '%';
        $('.cd-handle').css('top', tVal);
    }
}

var mouseX = 0,
    mouseY = 0;

setInterval(move, 1000 / 60);

function setWidthVal() {
    $('.resizable').css('width', currentValPer + "%");
    //console.log("width val: " + widthValue);
}

function move() {
    if (destinationValPer > 100) {
        destinationValPer = 100;
    }
    else if (destinationValPer < 0) {
        destinationValPer = 0;
    }
    currentValPer = lerp(currentValPer, destinationValPer, 0.1);
    //console.log("width val: " + widthValue);
    //console.log("currentValPer val: " + currentValPer);
    //console.log("destinationValPer val: " + destinationValPer);
    setWidthVal();
}

function lerp(start, end, amt) {
    return (1 - amt) * start + amt * end;
}

function map(x, in_min, in_max, out_min, out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}


function subm() {
    // var a = document.getElementById("key");
    // if (a.value == 1) {
    console.log('in here');
    incrementRightPer(10);
    // }
    // else {
    //     incrementLeftPer(3);
    // }
}

// var MyFunction = function() {

//     var counter = 10;
//     var timer = null;

//     function countdown() {
//         if (counter == 10) {
//             $(".time_box").html(counter);
//         }
//         if (counter <= 0) {
//             stopInterval();
//         }
//         else {
//             counter--;
//             $(".time_box").html(counter);
//         }
//     }

//     function reset() {
//         clearInterval(timer);
//         counter = 0;
//     }

//     function startInterval() {
//         $(".time_box").html(counter);
//         timer = setInterval(countdown, 1000);
//     }

//     function stopInterval() {
//         clearInterval(timer);
//     }

//     return {
//         startInterval: startInterval
//     }

// }();

// MyFunction.startInterval();


function startTimer(duration, display) {

}





function instruction() {

    swal({
            title: "Instructions",
            text: "Welcome Captain , save the world by answering correctly. With each correct answer, you will witness the dark world transforming to peaceful world. Lets do it fast , we got limited time!!!",
            showConfirmButton: true
        },

        function() {
            var fiveMinutes = 6,
                display = $('#time');
            var duration = fiveMinutes;
            var timer = duration,
                minutes, seconds;

            var intervalId = setInterval(function() {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                if (minutes == 0 && seconds <= 20) {
                    $("#headi").css('color', 'red');
                }
                if (minutes <= 0 && seconds <= 0) {
                    clearInterval(intervalId);
                }
                display.text(minutes + ":" + seconds);

                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        });



}



function badge_alert() {

   swal({   title: "Sweet!",   text: "Here's a custom image.",   imageUrl: "images/thumbs-up.jpg" });


}
