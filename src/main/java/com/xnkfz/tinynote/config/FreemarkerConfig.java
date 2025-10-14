package com.xnkfz.tinynote.config;

import com.xnkfz.tinynote.domain.LoginUser;
import com.xnkfz.tinynote.util.SecurityUtils;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class FreemarkerConfig {
    @Autowired
    private freemarker.template.Configuration configuration;

    @PostConstruct
    public void setSharedVariable() throws TemplateModelException {
        configuration.setSharedVariable("loginUser", (TemplateMethodModelEx) arguments -> {
            LoginUser user = SecurityUtils.getUser();
            return ObjectWrapper.DEFAULT_WRAPPER.wrap(user);
        });
    }
}
