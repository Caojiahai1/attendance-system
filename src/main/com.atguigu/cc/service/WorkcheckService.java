package cc.service;

import cc.model.Workcheck;
import cc.model.WorkcheckVO;

import java.util.List;

/**
 * Create By CJH on 2018/5/11
 */
public interface WorkcheckService {
    List<Workcheck> getAll(WorkcheckVO params);

    Integer getCount(WorkcheckVO params);

    void insert(Workcheck workcheck);
}