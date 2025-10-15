package cn.xilio.tinynote.config;

import cn.xilio.tinynote.domain.LoginUser;
import cn.xilio.tinynote.util.SecurityUtils;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;


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
