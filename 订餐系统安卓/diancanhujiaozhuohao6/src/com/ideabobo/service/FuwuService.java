package com.ideabobo.service;

import java.util.List;
import java.util.Map;

import com.ideabobo.model.Fuwu;
import com.ideabobo.util.Page;

public interface FuwuService {
	public void save(Fuwu model);
	public void update(Fuwu model);
	public Fuwu find(String uuid);
	public Fuwu find(Fuwu model);
	public void delete(Integer uuid);
	public List<Fuwu> list();
	public List<Fuwu> list(Fuwu model);
	public Page findByPage(Page page,Map paramsMap);
}
