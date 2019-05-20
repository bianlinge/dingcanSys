package com.ideabobo.action;


import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.swing.*;

import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ideabobo.model.Address;
import com.ideabobo.model.Bill;
import com.ideabobo.model.Dingzuo;
import com.ideabobo.model.Fuwu;
import com.ideabobo.model.Good;
import com.ideabobo.model.Line;
import com.ideabobo.model.Replay;
import com.ideabobo.model.Shop;
import com.ideabobo.model.User;
import com.ideabobo.service.BaseService;
import com.ideabobo.service.BillService;
import com.ideabobo.service.DingzuoService;
import com.ideabobo.service.GoodService;
import com.ideabobo.service.NoticeService;
import com.ideabobo.service.ReplayService;
import com.ideabobo.service.RoomService;
import com.ideabobo.service.ShopService;
import com.ideabobo.service.TypeService;
import com.ideabobo.service.UserService;
import com.ideabobo.util.GetNowTime;
import com.ideabobo.util.IdeaAction;

@Controller
public class WehallAction extends IdeaAction {
    @Resource
    private BaseService baseService;
    @Resource
    private BillService billService;
    @Resource
    private ShopService shopService;
    @Resource
    private GoodService goodService;
    @Resource
    private DingzuoService dingzuoService;
    @Resource
    private TypeService typeService;
    @Resource
    private UserService userService;
    @Resource
    private ReplayService replayService;
    @Resource
    private NoticeService noticeService;
    @Resource
    private RoomService roomService;
    public Gson gson = new Gson();
    private static final long serialVersionUID = -3218238026025256103L;

    public String wehall(){
//		String openid = request.getParameter("openid");
//		session.put("openid", openid);
        return SUCCESS;
    }

    public void login(){
        String username = request.getParameter("username");
        String passwd = request.getParameter("passwd");
        User user = new User();
        user.setPasswd(passwd);
        user.setUsername(encodeGet(username));
        User r = userService.find(user);
        if(r!=null){
        	session.put("user", r);
            renderJsonpObj(r);
        }else{
            renderJsonpString("fail");
        }
    }
    
    public void checkSession(){
    	Object obj = session.get("user");
    	if(obj!=null){
    		renderJsonpObj(obj);
    	}else{
    		renderJsonpString("fail");
    	}
    }
    
    public void clearSession(){
    	session.clear();
    }

    public void checkUser(){
        User u = new User();
        String username = request.getParameter("username");
        u.setUsername(username);
        User r = userService.find(u);
        if(r!=null){
            renderJsonpString("fail");
        }else{
            renderJsonpString("success");
        }
    }

    public void updateUser(){
        String tel = request.getParameter("tel");
        String qq = request.getParameter("qq");
        String wechat = request.getParameter("wechat");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String sex = request.getParameter("sex");
        String id = request.getParameter("id");

        User user = userService.find(id);

        user.setId(Integer.parseInt(id));
        user.setTel(tel);
        user.setWechat(wechat);
        user.setQq(qq);
        user.setEmail(email);
        user.setBirth(birth);
        user.setSex(encodeGet(sex));
        user.setAddress(encodeGet(request.getParameter("address")));

        userService.update(user);
        renderJsonpObj(user);
    }

    public void changePasswd(){
        String passwd = request.getParameter("passwd");
        String id = request.getParameter("id");
        User user = userService.find(id);
        user.setPasswd(passwd);
        userService.update(user);
        renderJsonpString("success");
    }

    public void register(){
        String tel = request.getParameter("tel");
        //String qq = request.getParameter("qq");
        //String wechat = request.getParameter("wechat");
        //String email = request.getParameter("email");
        //String birth = request.getParameter("birth");
        //String sex = request.getParameter("sex");
        String username = request.getParameter("username");
        String address = request.getParameter("address");
        String passwd = request.getParameter("passwd");
        //String sid = request.getParameter("sid");
        String roletype = "2";

        User user = new User();

        user.setTel(tel);
        //user.setWechat(wechat);
        //user.setQq(qq);
        //user.setEmail(email);
        //user.setBirth(birth);
        //user.setSex(encodeGet(sex));
        user.setPasswd(passwd);
        user.setRoletype(roletype);
        user.setUsername(encodeGet(username));
        user.setAddress(encodeGet(address));
        user.setOpenid(request.getParameter("openid"));
        //user.setSid(sid);
        userService.save(user);

        renderJsonpString("success");
    }

    public void listShop(){
        renderJsonpObj(shopService.list());
    }
    public void listGood(){
        String type = request.getParameter("stype");
        String sid = request.getParameter("sid");
        String title = request.getParameter("stitle");
        String sort = request.getParameter("order");
        title = encodeGet(title);
        String hql = "from Good t where 1=1";
        if (type != null&& !"".equals(type)) {
            hql+=" and t.typeid="+type;

        }
        if(sid != null&& !"".equals(sid)){
            hql+=" and t.sid="+sid;
        }
        if(title != null&& !"".equals(title)){
            hql+=" and t.gname='"+title+"'";
        }
        if(sort != null&& !"".equals(sort)){
            hql+=" order by "+sort+" desc";
        }else{
        	hql+=" order by xiaoliang desc";
        }
        /*ArrayList<Good> list = (ArrayList<Good>) goodService.queryObj(g);
        Collections.sort(list);*/
        renderJsonpObj(baseService.list(hql));
    }

    public void listType(){
        renderJsonpObj(typeService.list());
    }

    public void saveDingzuo(){
        Dingzuo dz = new Dingzuo();
        dz.setRenshu(request.getParameter("renshu"));
        dz.setXingming(encodeGet(request.getParameter("xingming")));
        dz.setShouji(request.getParameter("shouji"));
        dz.setShijian(request.getParameter("shijian"));
        dz.setTodate(request.getParameter("todate"));
        dz.setBeizhu(encodeGet(request.getParameter("beizhu")));
        dz.setShopid(request.getParameter("shopid"));
        dz.setShopname(encodeGet(request.getParameter("shopname")));
        dz.setOpenid(request.getParameter("openid"));
        dz.setType(Integer.parseInt(request.getParameter("type")));
        dz.setNdate(GetNowTime.getNowTimeNian());
        dingzuoService.save(dz);
        renderJsonpString("提交成功!");
    }

    public void saveBill(){
        Bill bill = new Bill();
        bill.setTotal(request.getParameter("total"));
        bill.setSid(request.getParameter("sid"));
        bill.setShop(encodeGet(request.getParameter("shop")));
        bill.setUid(request.getParameter("uid"));
        bill.setUser(encodeGet(request.getParameter("user")));
        bill.setNdate(GetNowTime.getNowTimeNian());
        bill.setGids(request.getParameter("gids"));
        bill.setGnames(encodeGet(request.getParameter("gnames")));
        bill.setAddress(encodeGet(request.getParameter("address")));
        bill.setTel(request.getParameter("tel"));
        bill.setNote(encodeGet(request.getParameter("note")));
        bill.setPrice(request.getParameter("price"));
        bill.setState("1");
        bill.setState("未付款");
        bill.setStatecn("未付款");
        bill.setCuidan("未催单");
        bill.setTotime(request.getParameter("totime"));
        bill.setTodate(request.getParameter("todate"));
        billService.save(bill);
        updateXiaoliang(bill);
        insertLine(Integer.parseInt(bill.getUid()), bill.getId());
        renderJsonpObj(bill);

    }
    
    public void delBill(){
        String id= request.getParameter("bid");
        billService.delete(Integer.parseInt(id));
        renderJsonpString("提交成功!");

    }
    
    public void billState(){
    	String idstr = request.getParameter("id");
    	Bill b = billService.find(idstr);
    	String statecn = request.getParameter("statecn");
    	statecn = encodeGet(statecn);
    	b.setState(statecn);
    	b.setStatecn(statecn);
    	billService.update(b);
    	renderJsonpObj(b);
    }
    
    public void billCuidan(){
    	String idstr = request.getParameter("id");
    	Bill b = billService.find(idstr);
    	b.setCuidan("已催单");
    	billService.update(b);
    	renderJsonpObj(b);
    }

    public void saveBills(){
        String bills = request.getParameter("bills");
        bills = encodeGet(bills);
        JsonParser parser = new JsonParser();
        JsonArray blist = parser.parse(bills).getAsJsonArray();
        Bill bone = null;
        for(int i=0;i<blist.size();i++){
            JsonElement jo = blist.get(i);
            JsonObject obj = (JsonObject) parser.parse(jo.toString());
            Bill bill = new Bill();
            bill.setTotal(obj.get("total").getAsString());
            bill.setSid(obj.get("sid").getAsString());
            bill.setShop(obj.get("shop").getAsString());
            bill.setUid(obj.get("uid").getAsString());
            bill.setUser(obj.get("user").getAsString());
            bill.setNdate(GetNowTime.getNowTimeNian());
            bill.setGids(obj.get("gids").getAsString());
            bill.setGnames(obj.get("gnames").getAsString());
            bill.setAddress(obj.get("address").getAsString());
            bill.setTel(obj.get("tel").getAsString());
            bill.setNote(obj.get("note").getAsString());
            bill.setTotime(obj.get("totime").getAsString());
            bill.setTodate(obj.get("todate").getAsString());
            bill.setStatecn("未付款");
            bill.setCuidan("未催单");
            billService.save(bill);
            if(i==0){
            	bone = bill;
            }
            insertLine(Integer.parseInt(bill.getUid()), bill.getId());
        }

        renderJsonpObj(bone);
    }

    public void mybills(){
        String uid = request.getParameter("uid");
        String sid = request.getParameter("sid");
        String type = request.getParameter("type");
        
        Bill b = new Bill();
        if(uid!=null && !uid.equals("")){
        	 b.setUid(uid);
        }
        if(sid!=null && !sid.equals("")){
       	 b.setSid(sid);
        }
        if(type!=null && !type.equals("")){
        	type = encodeGet(type);
          	 b.setStatecn(type);
           }
        renderJsonpObj(billService.list(b));
    }
    public void myshopbills(){
        String sid = request.getParameter("sid");
        Bill b = new Bill();
        b.setSid(sid);
        renderJsonpObj(billService.list(b));
    }
    public Bill updateXiaoliang(Bill bill){
    	String gid = bill.getGids();
        Good g = goodService.find(gid);
        int count = 0;
        if(g.getXiaoliang()!=null){
        	count = g.getXiaoliang();
        }
        count++;
        g.setXiaoliang(count);
        goodService.update(g);        
        return bill;
    }

    public void deleteGood(){
        String id = request.getParameter("id");
        goodService.delete(Integer.parseInt(id));
        renderJsonpString("success");
    }
    public void deleteBill(){
        String id = request.getParameter("id");
        billService.delete(Integer.parseInt(id));
        renderJsonpString("success");
    }
    public void listReplay(){
    	String pid = request.getParameter("pid");
    	Replay r = new Replay();
    	r.setPid(pid);
        renderJsonpObj(replayService.list(r));
    }
    public void listNotice(){
        renderJsonpObj(noticeService.list());
    }
    public void listRoom(){
        renderJsonpObj(roomService.list());
    }
    
    public void delDingzuo(){
    	baseService.delete(Integer.parseInt(request.getParameter("id")), Dingzuo.class);
    	renderJsonpString("0");
    }
    
    public void myDingzuo(){
    	String uid = request.getParameter("uid");
    	String type = request.getParameter("type");
    	
    	renderJsonpObj(baseService.list("from Dingzuo t where t.openid='"+uid+"' and t.type="+type));
    }
    
    public void addReplay(){
    	String uid = request.getParameter("uid");
    	String pid = request.getParameter("pid");
    	String note = encodeGet(request.getParameter("note"));
    	String username = encodeGet(request.getParameter("username"));
    	String ndate = GetNowTime.getNowTimeEn();
    	Replay m = new Replay();
    	m.setUid(uid);
    	m.setPid(pid);
    	m.setUsername(username);
    	m.setNote(note);
    	m.setNdate(ndate);
    	replayService.save(m);
    	renderJsonpString("success");
    }
    
    public void getShouye(){
        Good g = new Good();
        g.setShouye(1);
        renderJsonpObj(goodService.list(g));
    }
    
    public void listBillGoods(){
    	String gids = request.getParameter("gids");
    	String hql = "from Good u where u.id in ("+gids+")";
    	renderJsonpObj(goodService.list(hql));
    }
    
    public void saveAddress(){
    	String action = request.getParameter("action");
    	if(action.equals("add")){
    		Address address = (Address) getByRequest(new Address(), true);
    		baseService.save(address);
    	}else{
    		Address address = (Address) getByRequest(new Address(), true);
    		baseService.update(address);
    	}
    	renderJsonpString("0");
    }
    
    public void delAddress(){
    	String id = request.getParameter("id");
    	baseService.delete(Integer.parseInt(id), Address.class);
    	renderJsonpString("0");
    }
    
    public void listAddress(){
    	String uid = request.getParameter("uid");
    	renderJsonpObj(baseService.list("from Address t where t.uid = "+uid));
    }
    
    public void notMyDingzuo(){
		String uid = request.getParameter("uid");
		renderJsonpObj(baseService.list("from Dingzuo t where t.openid <> "+uid));
	}
    public void notMyPaidui(){
		String uid = request.getParameter("uid");
		renderJsonpObj(baseService.list("from Dingzuo t where t.type=2 and t.openid <> "+uid));
	}
    
    public void getLineNumber(){
    	List<Line> list = baseService.list("from Line t order by id asc");
    	String bid = request.getParameter("bid");
    	int count = 0;
    	for(int i=0;i<list.size();i++){
    		Line l = list.get(i);
    		if(l.getBid()==Integer.parseInt(bid)){
    			break;
    		}else{
    			count++;
    		}
    	}
    	renderJsonpString(count+"");
    }
    
    public void insertLine(int uid,int bid){
    	Line line = new Line();
    	line.setUid(uid);
    	line.setBid(bid);
    	baseService.save(line);
    }
    
    public void getShop(){
    	String id = request.getParameter("id");
    	Shop shop = (Shop) baseService.find(Integer.parseInt(id), Shop.class);
    	renderJsonpObj(shop);
    }
    
    public void saveGood(){
    	String action  = request.getParameter("action");
    	Good info = (Good) getByRequest(new Good(), true);
    	if(action!=null && action.equals("edit")){
    		baseService.update(info);
    	}else{
    		baseService.save(info);
    	}
        renderJsonpString("success");
    }
    
    public void delGood(){
    	String id = request.getParameter("id");
    	baseService.delete(Integer.parseInt(id), Good.class);
    	renderJsonpString("0");
    }
    
    public void zan(){
    	String id = request.getParameter("id");
    	Good g = (Good) baseService.find(Integer.parseInt(id), Good.class);
    	Integer zan = g.getZan();
    	if(zan!=null){
    		zan++;
    	}else{
    		zan = 1;
    	}
    	g.setZan(zan);
    	baseService.update(g);
    	renderJsonpString(zan+"");
    }
    
    public void addFuwu(){
    	Fuwu f = (Fuwu) getByRequest(new Fuwu(), true);
    	f.setNdate(GetNowTime.getNowTimeEn());
    	baseService.save(f);
    	renderJsonpString("0");
    }
    
    public void getUserByOpenid(){
    	String openid = request.getParameter("openid");
    	List<User> userlist = baseService.list("from User t where t.openid='"+openid+"'");
    	User user = null;
    	if(userlist!=null && userlist.size()>0){
    		user = userlist.get(0);
    	}
    	renderJsonpObj(user);
    }
    
}
