package com.myshop.dao;

import com.myshop.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Rohit Gupta
 */
public class CategoryDao {

    private final SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveCategory(Category cat) {

        int catId;
        try ( Session openSession = this.factory.openSession()) {
            Transaction beginTransaction = openSession.beginTransaction();
            catId = (int) openSession.save(cat);
            beginTransaction.commit();
        }
        return catId;
    }

    public List<Category> getCategories() {
        Session session = this.factory.openSession();
        Query q = session.createQuery("from Category");
        List<Category> list = q.list();
        return list;
    }

    public Category getCategoryById(int cid) {
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

}
