package com.myshop.helper;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Rohit Gupta
 */
public class FactoryProvider {

    private static SessionFactory factoy;

    public static SessionFactory getFactory() {

        try {
            if (factoy == null) {
                factoy = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }

        return factoy;
    }
}
