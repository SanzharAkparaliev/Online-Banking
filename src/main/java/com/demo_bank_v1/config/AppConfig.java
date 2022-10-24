package com.demo_bank_v1.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan(basePackages = {"com.demo_bank_v1"})
public class AppConfig extends WebMvcConfigurationSupport {
    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("css/**","images/**","js/**")
                .addResourceLocations("classpath:/static/css/","classpath:/static/images/","classpath:/static/js/");
    }

    @Bean
    public InternalResourceViewResolver viewResolver(){
        InternalResourceViewResolver jspviewResolver = new InternalResourceViewResolver();
        jspviewResolver.setPrefix("/WEB-INF/jsp/");
        jspviewResolver.setSuffix(".jsp");
        jspviewResolver.setViewClass(JstlView.class);

        return jspviewResolver;
    }
}
