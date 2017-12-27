import javax.naming.*;
import java.util.Base64;
import java.nio.charset.*;
public class Authorization {

   
   
    public static void main(String[] args) throws NamingException {

	final String authorization = "Basic YWRtaW46c2VjcmV0";
    if (authorization != null && authorization.startsWith("Basic")) {
        // Authorization: Basic base64credentials
        String base64Credentials = authorization.substring("Basic".length()).trim();
        String credentials = new String(Base64.getDecoder().decode(base64Credentials),
                Charset.forName("UTF-8"));
        // credentials = username:password
        final String[] values = credentials.split(":",2);
		System.out.println("UserName : " + values[0]);
		System.out.println("Password : " + values[1]);
		
		}
		
		}
}