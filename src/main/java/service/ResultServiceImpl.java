/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ResultDAO;
import java.util.List;
import model.Result;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dev
 */
public class ResultServiceImpl implements ResultService {
    
    private ResultDAO resultDAO;

    public void setResultDAO(ResultDAO resultDAO) {
        this.resultDAO = resultDAO;
    }
    
    @Transactional
    public void addResult(Result r) {
        resultDAO.addResult(r);
    }
    @Transactional
    public void updateResult(Result r) {
        resultDAO.updateResult(r);
    }
    @Transactional
    public List<Result> listResults() {
        return resultDAO.listResults();
    }
    @Transactional
    public Result getResultById(int id) {
        return resultDAO.getResultById(id);
    }
    @Transactional
    public void removeResult(Result r) {
        resultDAO.removeResult(r);
    }
    
}
