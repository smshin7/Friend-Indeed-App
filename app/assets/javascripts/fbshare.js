// $(document).ready(function() {

// Javascript Code for Facebook Share button
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=1410296982600187&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));





    $(document).ready(function(){
      $('#share_button').click(function(e){
        e.preventDefault();
        FB.ui(
        {
          method: 'share',
          href: 'https://friendindeed.herokuapp.com/?ref_id=<%= @user.token',
        }, function(response){});
      });
    });
