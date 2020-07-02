package notice;
import java.io.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Vector;
import javax.sql.DataSource;

import mail.sendBean;
import notice.noticeBean;
import notice.noticeMgr;

import javax.naming.Context;
import javax.naming.InitialContext;

public class noticeMgr {

	private static noticeMgr pool = new noticeMgr();

	public static noticeMgr getInstance() {
		return pool;
	}

	public noticeMgr() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return  ds.getConnection();
	}
	
	public Vector<noticeBean> NoticeList(int start, int end) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		
		Vector<noticeBean> vlist = new Vector<noticeBean>(); 
		try { con = pool.getConnection(); // DB 
	
			sql = "select * from db.notice order by idx desc, pos limit ?, ?"; //limit은 지정된 행만 불러온다. (start~end까지) - 페이지 단위로 처리 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start); 
			pstmt.setInt(2, end); 
			
		rs = pstmt.executeQuery();
		while (rs.next()) { 
			noticeBean bean = new noticeBean();
			bean.setIdx(rs.getInt("idx"));
			bean.setTitle(rs.getString("title"));
			bean.setContents(rs.getString("contents"));
			bean.setPos(rs.getInt("pos"));
			bean.setRef(rs.getInt("ref"));
			bean.setDepth(rs.getInt("depth"));
			bean.setNotice_date(rs.getString("notice_date")); 
			bean.setCount(rs.getInt("count"));
			vlist.add(bean); 
			}
		} catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
			}
		return vlist; 
			}
	

	public int getTotalCount() { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		int totalCount = 0; 
		try { 
			con = pool.getConnection(); 
				sql = "select count(idx) from db.notice"; 
				pstmt = con.prepareStatement(sql); 

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
		} 
		return totalCount; 
		}
	
	public boolean noticeInsert(noticeBean bean) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		
		noticeMgr nMgr=new noticeMgr();

		try {
			con=pool.getConnection();
			sql="insert into db.notice values(null,?,?,0,0,0,now(),0)";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2,bean.getContents());
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
	
	public noticeBean getNotice(int idx) {
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		noticeBean bean=new noticeBean();
		try {
			con=pool.getConnection();
			sql="select * from db.notice where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				bean.setIdx(rs.getInt("idx"));
				bean.setTitle(rs.getString("title"));
				bean.setContents(rs.getString("contents"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setNotice_date(rs.getString("notice_date"));
				bean.setCount(rs.getInt("count"));
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
	
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
		con = pool.getConnection();
		sql = "update db.notice set count=count+1 where idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
		if (con != null) try{ con.close(); }catch(SQLException ex) {}
		}
		}
		
	public boolean noticeDelete(int idx) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		noticeBean bean=new noticeBean();
		try {
			con=pool.getConnection();
			sql="delete from db.notice where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
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
	
		public void updateNotice(noticeBean bean) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try {
	con = pool.getConnection();
	sql = "update db.notice set title=?,contents=? where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, bean.getTitle());
	pstmt.setString(2, bean.getContents());
	pstmt.setInt(3, bean.getIdx());
	pstmt.executeUpdate();
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
	if (con != null) try{ con.close(); }catch(SQLException ex) {}
	}
	}
		
	public long getNewNotice(String date) {
		System.out.println("시작");
		long diffDay=0;
		try {
		SimpleDateFormat fo=new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		int yyyy=cal.get(Calendar.YEAR);
		int MM=cal.get(Calendar.MONTH);
		int dd=cal.get(Calendar.DATE);
		cal.set(yyyy, MM, dd);
		
		String today=fo.format(cal.getTime());
		java.util.Date starttime=null;
		java.util.Date endtime=null;
		long diff=0;
		starttime=fo.parse(date);
			endtime=fo.parse(today);
			diff=(endtime.getTime())-(starttime.getTime());
			diffDay=diff/(24*60*60*1000);
			System.out.println("끝");
		} catch (Exception e) {
		System.out.println("날짜 가져오기 오류");
		}
		System.out.println(diffDay);
		return diffDay;
		
	}
	
}
