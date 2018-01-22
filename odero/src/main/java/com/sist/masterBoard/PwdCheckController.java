package com.sist.masterBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.masterBoard.dao.MasterBoardDAO;
import com.sist.masterBoard.dao.NoticeVO;

@RestController
public class PwdCheckController {
	@Autowired
	private MasterBoardDAO dao;

	@RequestMapping("MasterBoardUpdate_ok.do")
	public String update_ok(NoticeVO vo)
	{
		String data="";
		boolean bCheck=dao.MasterBoardUpdate_ok(vo);
		if(bCheck==true)
		{
			/*data="<script>location.href=\"..\\..\\..\\MasterBoardContent.do?no="+vo.getNo()+"\";"
					+"</script>";*/
			return "redirect:MasterBoardContent.do?no="+vo.getNo();
			
		}
		else
		{
			/*data="<script>alert(\"비밀번호가 틀립니다!!\");"
					+"history.back();</script>"; */
			data="<script>alert(\"비밀번호가 틀립니다!!\");"
			+"</script>"; 
			//return "redirect:MasterBoardContent.do?no="+vo.getNo();
		}

		return data;
	}

	@RequestMapping("MasterBoardDelete_ok.do")
	public String board_delete_ok(int no,String pwd){
		String data="";
		boolean bCheck=dao.MasterBoardDelete_ok(no, pwd);
		if(bCheck==true){
			data="<script>location.href=\"MasterBoard.do\";"
					+"</script>";
		}
		else{
			data="<script>alert(\"비밀번호가 틀립니다!!\");"
					+"history.back();</script>"; 
		}

		return data;
	}
}