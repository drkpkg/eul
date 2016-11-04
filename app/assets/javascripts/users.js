// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  initThings();
});

$(document).on('turbolinks:load', function(){
  initThings();
});


function initThings(){
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });

  $('#pwdgen').click(function(){
    var pwd = generatePassword();
    $('#user_password').val(pwd);
  });

  $('.pop').popup();
}

function generatePassword() {
    var length = 8,
        charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
        retVal = "";
    for (var i = 0, n = charset.length; i < length; ++i) {
        retVal += charset.charAt(Math.floor(Math.random() * n));
    }
    return retVal;
}
