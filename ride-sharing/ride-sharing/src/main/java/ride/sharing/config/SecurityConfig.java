package ride.sharing.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import ride.sharing.config.auth.PrincipalDetailsService;
import ride.sharing.util.exception.CustomAuthFailureHandler;



@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true) // secured 어노테이션 활성화
@Component
@EnableWebSecurity 
public class SecurityConfig  {

	@Autowired
	private CustomAuthFailureHandler customFailureHandler;

	@Autowired
	PrincipalDetailsService principalDetailsService;

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	

	@Bean
	public AuthenticationManager authenticationManagerBean(AuthenticationConfiguration configuration) throws Exception {
		return configuration.getAuthenticationManager();
	}

	@Bean
	public AuthenticationProvider authenticationProvider() {
		var provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(principalDetailsService);
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}

	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**").allowedMethods("*");
			}
		};
	}
	
	

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.headers().frameOptions().sameOrigin();

		http.authorizeRequests()

				.antMatchers(HttpMethod.GET, "/board/**" ,"/ride/**").permitAll()
				.antMatchers(HttpMethod.POST, "/board/**","/ride/**").hasAnyAuthority("ROLE_USER", "ROLE_ADMIN", "ROLE_MANAGER")
				.antMatchers(HttpMethod.DELETE, "/board/**" ,"/ride/**").hasAnyAuthority("ROLE_USER", "ROLE_ADMIN", "ROLE_MANAGER")
				.antMatchers(HttpMethod.PUT, "/board/**" ,"/ride/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_MANAGER" ,"ROLE_USER")
				.antMatchers("/admin/member/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_MANAGER")
				.antMatchers("/admin/smtpUpdate").hasAnyAuthority("ROLE_ADMIN")
				.antMatchers("/admin", "/admin/", "/admin/main").hasAnyAuthority("ROLE_ADMIN", "ROLE_MANAGER")
			
				
				.antMatchers("/scrap/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_MANAGER" ,"ROLE_USER")
				.antMatchers("/note/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_MANAGER" ,"ROLE_USER")
				.antMatchers("/members/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_MANAGER" ,"ROLE_USER")
				
				
				.antMatchers("/", "/resources/**", "/loginForm/**", "/login/**", "/join/**", "/displayFile","/findIdPassword/**","/like/list")
				.permitAll()
				.anyRequest().authenticated() // 그 외 모든 요청은 인증된 사용자만 접근 가능

				.and()
				.formLogin().loginPage("/loginForm").usernameParameter("userId") // 기본값 username
				.passwordParameter("password").loginProcessingUrl("/login") // login 주소가 호출이 되면 시큐리티가 낚아채서 대신 로그인을 //// 진행준다.															
				.failureHandler(customFailureHandler) // 로그인 오류 실패 체크 핸들러
				.defaultSuccessUrl("/")
				.and()
				.logout()
				.logoutSuccessUrl("/"); // 로그아웃 성공시 이동할 URL 을 설정

		return http.build();
	}

}
