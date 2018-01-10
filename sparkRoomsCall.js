var urlopen = require ('urlopen');
var accessToken = "";
session.input.readAsJSON( function ( error, json) {
	if ( error ) {
		session.reject( 'input is not a valid JSON document' );
		return;
	}else{
		var token = json.access_token;
		accessToken = "Bearer ";
		accessToken = accessToken.concat(token);
		session.input.setVar('accesstoken', json.access_token);
		session.input.setVar('accesstoken_expiry', json.expires_in);
		session.input.setVar('refreshtoken', json.refresh_token);
		session.input.setVar('refreshtoken_expiry', json.refresh_token_expires_in);

		var options = {
			target: 'https://api.ciscospark.com/v1/rooms',
			sslClientProfile: 'TEST_Profile',
			method: 'get',
			headers: {"Authorization":accessToken}
		};


		urlopen.open (options, function (error, response) {
			if (error) {
				session.output.write ("urlopen connect error: " + JSON.stringify(error));
			} else {
				var responseStatusCode = response.statusCode;
				if (responseStatusCode == 200) {
					response.readAsJSON(function(error, responseData) {
						if (error) {
							session.output.write("readAsBuffer error: " + JSON.stringify(error));
						} else {

							session.output.write(responseData);
						} 
					});
				} else {
					session.output.write ("urlopen target return statusCode " + responseStatusCode);
				}
			}
		});
	}
});
