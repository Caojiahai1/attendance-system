package cc.service.impl;

import cc.dao.WorkcheckDAO;
import cc.model.Workcheck;
import cc.model.WorkcheckVO;
import cc.service.WorkcheckService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Create By CJH on 2018/5/11
 */
@Service
public class WorkcheckServiceImpl implements WorkcheckService {
    @Resource
    private WorkcheckDAO workcheckDAO;

    @Override
    public List<Workcheck> getAll(WorkcheckVO params) {
        return workcheckDAO.getAll(params);
    }

    @Override
    public Integer getCount(WorkcheckVO params) {
        return workcheckDAO.getCount(params);
    }

    @Override
    public void insert(Workcheck workcheck) {
        workcheckDAO.insert(workcheck);
    }

}