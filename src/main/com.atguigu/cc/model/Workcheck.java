package cc.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * Create By CJH on 2018/5/11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
@Table(name = "workcheck")
public class Workcheck {
    private int id;
    private int worktime;
    private int employeeid;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date checkdate;
    private String remarks;

    @Transient
    private String username;
}