package org.sang.listener;

import org.sang.dao.CountDao;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class VisitCountListener implements ServletContextListener {
    private CountDao countDao = new CountDao();
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        int count = countDao.getCount();
        sce.getServletContext().setAttribute("vc", count);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Object visitcount = sce.getServletContext().getAttribute("vc");
        countDao.updateCount(Integer.parseInt(visitcount.toString()));
    }
}
