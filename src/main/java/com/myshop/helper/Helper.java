package com.myshop.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author Rohit Gupta
 */
public class Helper {

    public static String get10Word(String des) {

        String[] strs = des.split(" ");

        if (strs.length > 10) {
            String res = "";
            for (int i = 0; i < 10; i++) {
                res = res + strs[i] + " ";
            }
            return (res + "...");
        } else {
            return (des + "...");
        }

    }

    public static String getTitleWord(String des) {

        String[] strs = des.split(" ");

        if (strs.length > 8) {
            String res = "";
            for (int i = 0; i < 8; i++) {
                res = res + strs[i] + " ";
            }
            return (res + "...");
        } else {
            return (des + "...");
        }

    }

    public static Map<String,Long> getCount(SessionFactory factory) {

        Session s = factory.openSession();
        String q1 = "Select count(*) from User";
        String q2 = "Select count(*) from Product";

        Query query1 = s.createQuery(q1);
        Query query2 = s.createQuery(q2);
        Long uCount = (Long) query1.list().get(0);
        Long pCount = (Long) query2.list().get(0);

        Map<String,Long> map = new HashMap<>();
        map.put("userCount", uCount);
        map.put("productCount", pCount);
        s.close();
        return map;

    }

}
