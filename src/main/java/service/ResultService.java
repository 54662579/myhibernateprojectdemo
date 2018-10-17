/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Result;

/**
 *
 * @author Dev
 */
public interface ResultService {
    public void addResult(Result r);

    public void updateResult(Result r);

    public List<Result> listResults();

    public Result getResultById(int id);

    public void removeResult(Result r);
}
