json.array!(@orders) do |order|
  json.extract! order, :name, :address, :email, :pay_type
  json.url order_url(order, format: :json)
end

jQuery(function($) {
  $('#payment-form').submit(function(event) {
    var $form = $(this);

    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);

    Stripe.createToken($form, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });
});

{
  id : "tok_u5dg20Gra", // String of token identifier,
  card : {...}, // Dictionary of the card used to create the token
  created : 1376441417, // Integer of date token was created
  currency: "usd", // String currency that the token was created in
  livemode: true, // Boolean of whether this token was created with a live or test API key
  object: "token", // String identifier of the type of object, always "token"
  used : false, // Boolean of whether this token has been used,
}

var stripeResponseHandler = function(status, response) {
  var $form = $('#payment-form');

  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // token contains id, last4, and card type
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
    $form.get(0).submit();
  }
};

# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://manage.stripe.com/account
Stripe.api_key = "sk_test_1nR7x8KVBBVYkx87xD1KzECH"

# Get the credit card details submitted by the form
token = params[:stripeToken]

# Create the charge on Stripe's servers - this will charge the user's card
begin
  charge = Stripe::Charge.create(
    :amount => 1000, # amount in cents, again
    :currency => "usd",
    :card => token,
    :description => "payinguser@example.com"
  )
rescue Stripe::CardError => e
  # The card has been declined
end
