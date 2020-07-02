package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import QnA.QnABean;
import mail.sendBean;
import mail.sendMgr;


public class answerMgr {
	
	private static answerMgr pool = new answerMgr();

	public static answerMgr getInstance() {
		return pool;
	}

	public answerMgr() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return  ds.getConnection();
	}

	public int questionCheck(String member, String date) {//그날 질문을 받았는지 확인하기
		StringTokenizer tokens=new StringTokenizer(date," ");
		String date2=tokens.nextToken()+"%";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		//x=-1 (처음), x=0(오늘 이미 받음), x=n(오늘은 안받았으며 n번째 질문까지 받음)
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count from db.answer where memberID=?");
			pstmt.setString(1, member);
			rs = pstmt.executeQuery();
			if (rs.next())// 있다면 이 회원은 처음 질문은 받는건 아니다.
			{
				x = rs.getInt("count");  //count 값을 가져와 몇번 째 질문까지 받았는지 확인한다
				pstmt = conn.prepareStatement("select count from db.answer where memberID=? and date like ?");
				pstmt.setString(1, member);
				pstmt.setString(2, date2);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x=0;//오늘 이미 질문을 받았다.
				}
				
			}
			else//없다
				x = -1;// 처음 질문을 받는 것이다.
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
	
	public String getQuestion(int idx) {
		idx=idx%365;
		String question="";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select question from db.question where idx=?");
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			question = rs.getString("question"); 
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return question;
	}
	
	public boolean insertAnswer(answerBean bean) {//답변저장하기
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String sql2=null;
		sendMgr sMgr=new sendMgr();
		try {
			con=pool.getConnection();
			sql="insert into db.answer values(null,?,?,?,?,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, bean.getAnswer());
			pstmt.setString(2,bean.getGood());
			pstmt.setString(3, bean.getBad());
			pstmt.setString(4, bean.getDecide());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getMember());
			pstmt.setInt(7, bean.getCount());
			pstmt.setInt(8, bean.getQidx());
			pstmt.executeUpdate(); 
			
			sql2="update db.answer set count =? where memberID=?";
			pstmt = con.prepareStatement(sql2); 
			pstmt.setInt(1,bean.getCount());
			pstmt.setString(2,bean.getMember());
			pstmt.executeUpdate(); 
			x=true;
			
		
	}catch (Exception e) { e.printStackTrace(); 
	} finally { 
		if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
		if (pstmt != null) try{ pstmt.close(); 
		}catch(SQLException ex) {} 
		if (con != null) try{ con.close(); }catch(SQLException ex) {} 
}
	

		return x; 
	}
	
	
	public Vector<answerBean> getAnswerList(String id, int start, int end) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		Vector<answerBean> vlist = new Vector<answerBean>(); 
		try { con = pool.getConnection(); // DB 
	
			sql = "select * from db.answer where memberID=?  order by aidx desc limit ?, ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end); 
			
		rs = pstmt.executeQuery();
		
		while (rs.next()) { 
			answerBean bean = new answerBean();
			bean.setIdx(rs.getInt("aidx"));
			bean.setAnswer(rs.getString("answer"));
			bean.setGood(rs.getString("good"));
			bean.setBad(rs.getString("bad"));
			bean.setDecide(rs.getString("decide"));
			bean.setDate(rs.getString("date"));
			bean.setCount(rs.getInt("count"));
			bean.setQidx(rs.getInt("qidx"));
			vlist.add(bean); 
			}
		} catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
			} 
		System.out.println(vlist.size());
		return vlist; 
			}
	
	public int getTotalCount(String id) { 
	Connection con = null; 
	PreparedStatement pstmt = null; 
	ResultSet rs = null; 
	String sql = null; 
	int totalCount = 0; 
	try { 
		con = pool.getConnection(); 
			sql = "select count(aidx) from db.answer where memberID=?"; 
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			
		rs = pstmt.executeQuery(); 
		if (rs.next()) { 
			totalCount = rs.getInt(1);
			} 
		} catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); 
			}catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
	} return totalCount; 
	}
	
	
	
	public answerBean getAnswerContents(int idx) {
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		answerBean bean=new answerBean();
		try {
			con=pool.getConnection();
			sql="select * from db.answer where aidx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) { 
				bean.setIdx(rs.getInt("aidx"));
				bean.setAnswer(rs.getString("answer"));
				bean.setGood(rs.getString("good"));
				bean.setBad(rs.getString("bad"));
				bean.setDecide(rs.getString("decide"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getInt("count"));
				bean.setQidx(rs.getInt("qidx"));
				} 
			
		}catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); 
			}catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
	}
		return bean;
	}
	
	public boolean updateAnswer(answerBean bean) {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= null;
		boolean result=false;
		try{
		con= pool.getConnection();
		sql= "update db.answer set answer=?,good=?,bad=?,decide=? where aidx=?";
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, bean.getAnswer());
		pstmt.setString(2,bean.getGood());
		pstmt.setString(3,bean.getBad());
		pstmt.setString(4,bean.getDecide());
		pstmt.setInt(5, bean.getIdx());
		pstmt.executeUpdate();
		result=true;
		} catch(Exception e) {
		e.printStackTrace();
		} finally{
		if(rs!= null) try{ rs.close(); }catch(SQLException ex) {}
		if(pstmt!= null) try{ pstmt.close(); }catch(SQLException ex) {}
		if(con!= null) try{ con.close(); }catch(SQLException ex) {}
		}
		return result;
	}
	
	
}
