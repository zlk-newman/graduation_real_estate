package com.zlk.control;

import com.zlk.bean.MassageBean;
import com.zlk.service.IMassageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class MassageControl {
    @Resource
    private IMassageService massageService;

    //发送
    //用户端的pName、客户端的aName在前端最下面的留言默认为admin,验证设在前端
    @RequestMapping("/intoAdminMessage")
    public String IntoAdminMessage(MassageBean m){
        if(m.getMasId()==null){
            int i=massageService.saveOrUpdateUserInfo(m);
            return "MessageManager/MessageAddDetail";
        }else{
            return "MessageManager/ANameMessage_sign_up";
        }

    }
    //查询(aName批量查看)
    @ResponseBody
    @RequestMapping("/aNameSelectMessage")
    public List<MassageBean> ANameSelectMessage(MassageBean m){
        List<MassageBean> messageList=massageService.selectByA(m);
            return messageList;
    }
    //查询(pName批量查看)
    @ResponseBody
    @RequestMapping("/pNameSelectMessage")
    public List<MassageBean> PNameSelectMessage(MassageBean m){
        List<MassageBean> messageList=massageService.selectByP(m);
            return messageList;
    }
    //删除
    /**
     * 使用ajax进行删除操作
     *
     * @param masId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/deleteMessageByID")
    public int DeleteMessageByID(Integer masId) {
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = massageService.deleteUserInfoByID(masId);
        return i;
    }

}
