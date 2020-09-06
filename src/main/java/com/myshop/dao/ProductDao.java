package com.myshop.dao;

import com.myshop.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Rohit Gupta
 */
public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean t = false;
        try {

            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            t = true;
        } catch (Exception e) {
            e.printStackTrace();
            t = false;
        }
        return t;
    }

    //get all product
    public List<Product> getAllProduct() {
        Session s = this.factory.openSession();
        Query q = s.createQuery("from Product");
        List<Product> list = q.list();

        return list;
    }

    //product by id
    public List<Product> getAllProductById(int cid) {
        Session s = this.factory.openSession();
        Query q = s.createQuery("from Product as p where p.category.categoryId =: id");
        q.setParameter("id", cid);
        List<Product> list = q.list();

        return list;
    }
}
