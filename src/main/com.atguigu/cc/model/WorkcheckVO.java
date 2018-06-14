package cc.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * Create By CJH on 2018/5/11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class WorkcheckVO {
    private String username;
    private Integer limit;
    private Integer offset;
    private String checkdate;
}