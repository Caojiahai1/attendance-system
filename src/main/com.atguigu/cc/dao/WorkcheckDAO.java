package cc.dao;

import cc.model.Workcheck;
import cc.model.WorkcheckVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create By CJH on 2018/5/11
 */
@Repository
public interface WorkcheckDAO {
    List<Workcheck> getAll(WorkcheckVO params);

    Integer getCount(WorkcheckVO params);

    void insert(Workcheck workcheck);
}