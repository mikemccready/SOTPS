// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });



$(function(){
	$('#menuToggle').hide();
	$('#navTop').click(function(){
		$('#menuToggle').slideToggle(700);
	});
});



var handler = StripeCheckout.configure({
key: "<%= Rails.configuration.stripe[:publishable_key] %>",
image: '',
token: function(token, args) {
      document.getElementById("stripeToken").value = token.id;                              
      document.getElementById("stripeEmail").value = token.email;
      document.getElementById("chargeForm").submit();
    }
  });

document.getElementById('customButton').addEventListener('click', function(e) {
  // Open Checkout with further options
  handler.open({
    name: 'SOTPS',
    description: 'Donate',
    amount: 5*100,
  });
  e.preventDefault();
});

