package com.kaoni.main.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kaoni.common.chabun.ChabunUtil;
import com.kaoni.common.chabun.Service.ChabunService;
import com.kaoni.main.Service.MainService;
import com.kaoni.main.VO.MainVO;
import com.kaoni.pcr.Service.PcrService;

@Controller
public class MainController {
	Logger logger = Logger.getLogger(MainController.class);
	
	@Autowired(required=false)
	private MainService mainservice;
	
	@Autowired
	private ChabunService chabunService;
	
	@Autowired
	private PcrService pcrservice;
	
	//String emnum = ChabunUtil.getMemChabun("EM", chabunService.getMemberChabun().getEmnum());
	@ResponseBody
	@RequestMapping(value="pcrdata", method=RequestMethod.GET)
	public String pcrdata(MainVO mvo, Model model) {
		String mainnum = ChabunUtil.getMainChabun("M", chabunService.getMainChabun().getMainnum());
		MainVO mvoinsert = new MainVO();
		mvoinsert.setMainnum(mainnum);
		int nCnt =mainservice.pcrdatainsert(mvoinsert);
		
		List<MainVO> pcrlist = mainservice.pcrdata(mvo);
		mvo = pcrlist.get(0);
		 String json = new Gson().toJson(mvo);
		if(pcrlist.size()>0) {
			return json;
		}
		return "error";
	}
	@ResponseBody
	@RequestMapping(value="jungukdata", method=RequestMethod.GET)
	public String jungukdata(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml;charset=UTF-8");
		BufferedReader br = null;
		try {
			String urlstr = "http://openapi.seoul.go.kr:8088/61534d4f74736e6237357968725667/json/TbCorona19CountStatus/1/1/";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			response.getWriter().append(result);
			 String json = new Gson().toJson(result);
			 response.getWriter().close();
			return json;
	}catch(Exception  e){
	}
		return "error";
	}

	
}
