package com.kaoni.pcr.Conroller; 
 
import java.util.List; 
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpSession; 
 
import org.apache.log4j.Logger; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.ResponseBody; 
 
import com.google.gson.Gson; 
import com.kaoni.Member.VO.MemberVO; 
import com.kaoni.common.chabun.ChabunUtil; 
import com.kaoni.common.chabun.Service.ChabunService; 
import com.kaoni.main.VO.MainVO; 
import com.kaoni.pcr.Service.PcrService; 
import com.kaoni.pcr.VO.PcrVO; 
 
@Controller 
public class PcrController { 
Logger logger = Logger.getLogger(PcrController.class); 
 
@Autowired(required=false) 
private PcrService pcrService; 
@Autowired 
private ChabunService chabunService; 
 
@RequestMapping(value="pcrForm", method=RequestMethod.GET) 
public String pcrForm(HttpServletRequest req) { 
HttpSession session = req.getSession(); 
String checklogin = (String)session.getAttribute("emnum"); 
if(checklogin==null) { 
return "needlogin"; 
} 
 
return "Pcr/pcrForm"; 
} 
@RequestMapping(value="pcrInsert", method=RequestMethod.GET) 
public String pcrInsert(HttpServletRequest req) { 
String pnum = ChabunUtil.getPcrChabun("P", chabunService.getPcrChabun().getPnum()); 
HttpSession session = req.getSession(); 
PcrVO pvo = null; 
pvo = new PcrVO(); 
pvo.setPnum(pnum); 
pvo.setEmnum((String)session.getAttribute("emnum")); 
pvo.setIsolea(req.getParameter("isolea")); 
pvo.setIsoleb(req.getParameter("isoleb")); 
pvo.setPoutcome(req.getParameter("poutcome")); 
pvo.setPcontent(req.getParameter("pcontent")); 
pvo.setDeleteyn("Y"); 
int nCnt = pcrService.pcrInsert(pvo); 
req.setAttribute("nCnt", nCnt); 
if(nCnt>0) {return "redirect:/";}  
else {return "Pcr/pcrForm";} 
} 
@RequestMapping(value="pcrSelectAll", method=RequestMethod.GET) 
public String pcrSelectAll(PcrVO pvo, Model model) { 
logger.info("contoller select all -------------"); 
int pageSize = 10; 
int groupSize = 5; 
int curPage = 1; 
int totalCount = 0;  
pvo.setCurPage(String.valueOf(curPage)); 
pvo.setGroupSize(String.valueOf(groupSize)); 
pvo.setPageSize(String.valueOf(pageSize)); 
pvo.setTotalCount(String.valueOf(totalCount)); 
List<PcrVO> listAll = pcrService.pcrSelectAll(pvo); 
if(listAll.size()>0) { 
model.addAttribute("pagingVO", pvo); 
model.addAttribute("listAll", listAll); 
return "Pcr/pcrSelectAll"; 
} 
return "Pcr/pcrSelectAll"; 
} 
@RequestMapping(value="PcrUpdateForm", method=RequestMethod.GET) 
public String pcrUpdateForm(PcrVO pvo, Model model, HttpServletRequest req) { 
String pnum = req.getParameter("pnum"); 
pvo.setEmnum(req.getParameter("emnum")); 
pvo.setPnum(pnum); 
List<PcrVO> list = pcrService.pcrUpdateForm(pvo); 
if(list.size()>0) { 
model.addAttribute("list", list); 
return "Pcr/pcrUpdateForm"; 
} 
return "needlogin"; 
} 
 
@RequestMapping(value="pcrUpdate", method=RequestMethod.GET) 
public String pcrUpdate(PcrVO pvo, Model model, HttpServletRequest req) { 
HttpSession session = req.getSession(); 
String emnum = (String)session.getAttribute("emnum"); 
 
pvo.setEmnum(req.getParameter("pnum")); 
pvo.setEmnum(req.getParameter("emnum")); 
pvo.setPoutcome(req.getParameter("poutcome")); 
pvo.setIsoleb(req.getParameter("isoleb")); 
pvo.setPcontent(req.getParameter("pcontent")); 
pvo.setDeleteyn(req.getParameter("deleteyn")); 
int nCnt = pcrService.pcrUpdate(pvo); 
if(nCnt>0) { 
 
return "redirect:/"; 
}else { 
return "Pcr/pcrUpdateForm"; 
} 
 
} 
 
@ResponseBody 
@RequestMapping(value="pcrMain", method=RequestMethod.GET, produces = "application/text; charset=utf8") 
public String pcrMain(PcrVO pvo, Model model) { 
 
List<PcrVO> listmain = pcrService.pcrMain(pvo);; 
String jsontest = new Gson().toJson(listmain); 
 
 
if(listmain.size()>0) { 
return jsontest; 
} 
return "error"; 
} 
@RequestMapping(value="pcrMine", method=RequestMethod.GET) 
public String pcrMine(PcrVO pvo, Model model,HttpServletRequest req) { 
HttpSession session = req.getSession(); 
String emnum = (String)session.getAttribute("emnum"); 
pvo.setEmnum(emnum); 
List<PcrVO> listmine = pcrService.pcrMine(pvo); 
if(listmine.size()>0) { 
model.addAttribute("listmine", listmine); 
return "Pcr/pcrMine"; 
}else { 
return "needlogin";} 
} 
 
 
@RequestMapping(value="pcrSearch", method=RequestMethod.GET) 
public String pcrSearch(PcrVO pvo, Model model,HttpServletRequest req) { 
 
pvo.setSearch(req.getParameter("search")); 
List<PcrVO> listsearch = pcrService.pcrSearch(pvo); 
if(listsearch.size()>0) { 
model.addAttribute("listsearch", listsearch); 
return "Pcr/pcrSearchResult"; 
}else { 
return "error";} 
} 
 
 
}