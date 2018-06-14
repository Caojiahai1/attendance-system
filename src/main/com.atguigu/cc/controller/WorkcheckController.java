package cc.controller;

import cc.model.Workcheck;
import cc.model.WorkcheckVO;
import cc.service.WorkcheckService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Create By CJH on 2018/5/11
 */
@Controller
@RequestMapping(value = "/workcheck")
public class WorkcheckController {
    @Autowired
    private WorkcheckService workcheckService;

    @ResponseBody
    @RequestMapping(value = "list")
    public JSONObject list (HttpServletRequest request, WorkcheckVO params) {
        JSONObject jsonObject = new JSONObject();
        List<Workcheck> list = workcheckService.getAll(params);
        jsonObject.put("rows", list);
        jsonObject.put("total", workcheckService.getCount(params));
        return jsonObject;
    }

    @ResponseBody
    @PostMapping(value = "checkData")
    public JSONObject checkData (@RequestParam String dataJson) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success", true);

        JSONArray jsonArray = JSON.parseArray(dataJson);

        for (Object object : jsonArray) {
            JSONObject json = (JSONObject) object;
            Workcheck workcheck = JSONObject.toJavaObject(json, Workcheck.class);
            workcheckService.insert(workcheck);
        }

        return jsonObject;
    }
}