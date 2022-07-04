package Assignment.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import Assignment.interceptors.AuthenticateInterceptor;

@Configuration
public class IntercepterConfig implements WebMvcConfigurer{
	@Autowired
	private AuthenticateInterceptor authenInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(this.authenInterceptor).addPathPatterns("/**").excludePathPatterns("/users/home","/auth/login","/auth/register");
	}
}
