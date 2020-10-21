package com.fun.common.utils;

import com.alibaba.fastjson.JSONObject;
import com.fun.common.constant.Constants;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.lionsoul.ip2region.DataBlock;
import org.lionsoul.ip2region.DbConfig;
import org.lionsoul.ip2region.DbSearcher;
import org.lionsoul.ip2region.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;


/**
 * 通过 IP 查询地址
 * 这里用的是免费的淘宝接口，可以做成本地查询，如有需要提 issue
 *
 * @author DJun
 */
public class AddressUtils {
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);
    private static final String IP_URL = "http://ip.taobao.com/service/getIpInfo.php";

    /**
     * 方案一：
     * 淘宝IP查询地区接口实现
     * 此方法不可靠，经常出问题
     *
     * @param ip ip
     * @return 地区+成实
     */
    public static String getCityInfo(String ip) {
        // 关闭查询后，记录地区内容为 XX XX
        String address = "XX XX";

        // 内网不查询
        if (IpUtils.internalIp(ip)) {
            return "内网IP";
        }

        if (Constants.ADDRESS_ENABLED) {
            String rspStr;
            try {
                // 一般不会抛异常，只有本地调试 断网时，则会因为网络异常问题抛异常
                rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip);
            } catch (Exception e) {
                log.error("获取IP为{}地理位置异常 ", ip);
                return address;
            }

            JSONObject obj = JSONObject.parseObject(rspStr);
            JSONObject data = obj.getObject("data", JSONObject.class);
            String region = data.getString("region");
            String city = data.getString("city");
            address = region + " " + city;
        }
        return address;
    }

    /**
     * 方案二：
     * ip2region实现
     *
     * @param ip ip
     * @return 详细地址
     */
    public static String getRealAddressByIP(String ip) {
        DbSearcher searcher = null;
        try {
            String dbPath = AddressUtils.class.getResource("/ip2region/ip2region.db").getPath();
            File file = new File(dbPath);
            if (!file.exists()) {
                String tmpDir = System.getProperties().getProperty("java.io.tmpdir");
                dbPath = tmpDir + File.separator + "ip.db";
                file = new File(dbPath);
                InputStream resourceAsStream = AddressUtils.class.getClassLoader().getResourceAsStream("classpath:ip2region/ip2region.db");
                if (resourceAsStream != null) {
                    FileUtils.copyInputStreamToFile(resourceAsStream, file);
                }
            }
            DbConfig config = new DbConfig();
            searcher = new DbSearcher(config, file.getPath());
            Method method = searcher.getClass().getMethod("btreeSearch", String.class);
            if (!Util.isIpAddress(ip)) {
                log.error("Error: Invalid ip address");
            }
            DataBlock dataBlock = (DataBlock) method.invoke(searcher, ip);
            return dataBlock.getRegion();
        } catch (Exception e) {
            log.error("获取地址信息异常，{}", e.getMessage());
            return StringUtils.EMPTY;
        } finally {
            if (searcher != null) {
                try {
                    searcher.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
