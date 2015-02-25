$(document).ready(function() {
  $('ul#subnav a').click(function() {
    $('ul#subnav a').css("background-color", "#E9EAEA");
    $('ul#subnav a').css("color", "#231F20");
    $(this).css("background-color", "#231F20");
    $(this).css("color", "#E9EAEA");
  });

});