package com.fun.framework.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * Admin代码生成工具相关信息
 *
 * @author DJun
 * @date 2019/11/23 10:55
 */
@Component
@ConfigurationProperties(prefix = "gen")
@PropertySource(value = {"classpath:fun-boot.properties"})
public class GenConfig {
    /** 作者 */
    public static String author;

    /** 生成包路径 */
    private static String packageName;

    /** 自动去除表前缀，默认是true */
    private static String autoRemovePre;

    /** 表前缀(类名不会包含表前缀) */
    private static String tablePrefix;

    public static String getAuthor()
    {
        return author;
    }

    public void setAuthor(String author)
    {
        GenConfig.author = author;
    }

    public static String getPackageName()
    {
        return packageName;
    }

    public void setPackageName(String packageName)
    {
        GenConfig.packageName = packageName;
    }

    public static String getAutoRemovePre()
    {
        return autoRemovePre;
    }

    public void setAutoRemovePre(String autoRemovePre)
    {
        GenConfig.autoRemovePre = autoRemovePre;
    }

    public static String getTablePrefix()
    {
        return tablePrefix;
    }

    public void setTablePrefix(String tablePrefix)
    {
        GenConfig.tablePrefix = tablePrefix;
    }
}
