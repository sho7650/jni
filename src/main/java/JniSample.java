import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration
public class JniSample {
    public native double exp(double a);
    public native boolean strcmp(String a, String b);

    @RequestMapping("/")
    String home() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        System.loadLibrary("JniSample");
        JniSample s = new JniSample();
	System.out.println("exp(1.0) -> " + s.exp(1.0));
	System.out.println("exp(2.0) -> " + s.exp(2.0));
	System.out.println("strcmp(\"Mutsuki\", \"Namajima\") -> " + s.strcmp("Mutsuki", "Nakajima"));
	System.out.println("strcmp(\"Mutsuki\", \"Mutsuki\") -> " + s.strcmp("Mutsuki", "Mutsuki"));
	SpringApplication.run(JniSample.class, args);
    }
}
