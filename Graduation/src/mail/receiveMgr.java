package mail;
import java.io.*;
import java.sql.*;
import java.util.Vector;
import javax.sql.DataSource;

import question.answerBean;

import javax.naming.Context;
import javax.naming.InitialContext;


public class receiveMgr {

	private static receiveMgr pool = new receiveMgr();

	public static receiveMgr getInstance() {
		return pool;
	}

	public receiveMgr() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return  ds.getConnection();
	}
	
	public Vector<receiveBean> getReceiveList(String id,String kind, int start, int end) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		Vector<receiveBean> vlist = new Vector<receiveBean>(); 
		try { con = pool.getConnection(); // DB 
	
			sql = "select * from db.receivemail where receiver=? and kind=? and report=0 order by idx desc limit ?, ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setString(2, kind); 
			pstmt.setInt(3, start); 
			pstmt.setInt(4, end); 
			
		rs = pstmt.executeQuery();
		while (rs.next()) { 
			receiveBean bean = new receiveBean();
			bean.setIdx(rs.getInt("idx"));
			bean.setReceiver(rs.getString("receiver")); 
			bean.setTitle(rs.getString("receiveTitle"));
			bean.setContents(rs.getString("receiveContents"));
			bean.setDate(rs.getString("date"));
			bean.setSender(rs.getString("senderIdx"));
			bean.setCount(rs.getString("count"));
			bean.setSend_idx(rs.getInt("send_idx"));
			bean.setReport(rs.getString("report"));

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
	
	public Vector<receiveBean> getReportList(String id, int start, int end) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		Vector<receiveBean> vlist = new Vector<receiveBean>(); 
		try { con = pool.getConnection(); // DB 
	
			sql = "select * from db.receivemail where receiver=? and report=1 order by idx desc limit ?, ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end); 
			
		rs = pstmt.executeQuery();
		while (rs.next()) { 
			receiveBean bean = new receiveBean();
			bean.setIdx(rs.getInt("idx"));
			bean.setReceiver(rs.getString("receiver")); 
			bean.setTitle(rs.getString("receiveTitle"));
			bean.setContents(rs.getString("receiveContents"));
			bean.setDate(rs.getString("date"));
			bean.setSender(rs.getString("senderIdx"));
			bean.setCount(rs.getString("count"));
			bean.setSend_idx(rs.getInt("send_idx"));
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
	public int getReportCount_admin(String id) { 
	Connection con = null; 
	PreparedStatement pstmt = null; 
	ResultSet rs = null; 
	String sql = null; 
	int totalCount = 0; 
	try { 
		con = pool.getConnection(); 
			sql = "select count(idx) from db.receivemail where receiver=?"; 
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
		
	
	public int getTotalCount(String id ,String kind) { 
	Connection con = null; 
	PreparedStatement pstmt = null; 
	ResultSet rs = null; 
	String sql = null; 
	int totalCount = 0; 
	try { 
		con = pool.getConnection(); 
			sql = "select count(idx) from db.receivemail where receiver=? and kind=? and report=0"; 
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			pstmt.setString(2, kind); 
			
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
	
	public int getNewmessage(String id) { // 받은 고민함 버튼에 새로운 고민을 받을 경우 이미지 사용
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		int totalCount = 0; 
		try { 
			con = pool.getConnection(); 
			 if(id.equals("rhksflwk")) {
				 sql = "select count(idx) from db.receivemail where count='0' and receiver=?"; 
			 }else {
				sql = "select count(idx) from db.receivemail where count='0' and receiver=? and report=0"; }
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
	
	public int newR_message(String id) { //받은 답장함 게시판에 이미지 사용
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		int totalCount = 0; 
		try { 
			con = pool.getConnection(); 
				sql = "select idx from db.receivemail where count='0' and receiver=?"; 
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
	
	public int getReplyCount(String id) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String sql2 = null; 

		int kind = 0; 
		try { 
			con = pool.getConnection(); 
				sql = "select count(*) from db.receivemail where count='1' and receiver=?"; 
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, id);
				
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				kind = rs.getInt(1);
				} 
			
		
			} catch (Exception e) { e.printStackTrace(); 
			} finally { 
				if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
				if (pstmt != null) try{ pstmt.close(); 
				}catch(SQLException ex) {} 
				if (con != null) try{ con.close(); }catch(SQLException ex) {} 
		} return kind; 
		}
	
	public receiveBean getreceiveContents(int idx) {
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		receiveBean bean=new receiveBean();
		try {
			con=pool.getConnection();
			sql="select * from db.receivemail where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) { 
				bean.setIdx(rs.getInt("idx"));
				bean.setSender(rs.getString("senderIdx"));
				bean.setReceiver(rs.getString("receiver"));
				bean.setContents(rs.getString("receiveContents"));
				bean.setTitle(rs.getString("receiveTitle"));
				bean.setDate(rs.getString("date"));
				bean.setCount(rs.getString("count"));
				bean.setSend_idx(rs.getInt("send_idx"));
				bean.setAdd_title(rs.getString("add_title"));
				bean.setAdd_contents(rs.getString("add_contents"));



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
	
	
	
	public boolean worryDelete(String idx) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		int s_idx =  Integer.parseInt(idx);
		try {
			con=pool.getConnection();
			sql="delete from db.sendmail where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, s_idx);
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
	
	public boolean receiveDelete(int idx) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		try {
			con=pool.getConnection();
			sql="delete from db.receivemail where idx=?";
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
	
	
	

	
	//신고 받으면 관리자에게 전송
public sendBean sendManager(int send_idx,int kind) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	String sql2 = null;
	ResultSet rs = null; 
	int idx=0;
	String memName = "rhksflwk";
	sendBean bean=new sendBean();
	try {
	con = getConnection();
	if(kind==0) {
	sql = "select * from db.sendmail where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, send_idx);
	rs = pstmt.executeQuery(); 
	while(rs.next())
	{
		bean.setIdx(rs.getInt("idx"));
		bean.setSender(rs.getString("senderIdx"));
		bean.setReceiver(rs.getString("receiver"));
		bean.setSenderContents(rs.getString("senderContents"));
		bean.setSenderTitle(rs.getString("senderTitle"));
		bean.setDate(rs.getString("date_"));
		bean.setKind(rs.getString("kind"));
		System.out.println("select 들어옴");
		
	}
	
	
	sql2="insert into db.receivemail value(null,?,?,?,?,null,null,null,?,?,0,?,?,?,?,1)";
	pstmt = con.prepareStatement(sql2); 
	pstmt.setString(1,memName);
	pstmt.setString(2,bean.getSenderTitle());
	pstmt.setString(3,  bean.getSenderContents());
	pstmt.setString(4, bean.getSender());
	pstmt.setString(5, bean.getDate());
	pstmt.setString(6, bean.getKind());
	pstmt.setInt(7, send_idx);
	pstmt.setString(8, bean.getAdd_title());
	pstmt.setString(9, bean.getAdd_contents());
	pstmt.setString(10,bean.getReceiver());

	pstmt.executeUpdate(); 
	
	}
	else {
		sql = "select * from db.receivemail where idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, send_idx);
		rs = pstmt.executeQuery(); 
		while(rs.next())
		{
			bean.setIdx(rs.getInt("idx"));
			bean.setSender(rs.getString("senderIdx"));
			bean.setReceiver(rs.getString("receiver"));
			bean.setSenderContents(rs.getString("receiveContents"));
			bean.setSenderTitle(rs.getString("receiveTitle"));
			bean.setDate(rs.getString("date"));
			bean.setKind(rs.getString("kind"));
			System.out.println("select 들어옴");
			
		}
		
		
		sql2="insert into db.receivemail value(null,?,?,?,?,null,null,null,?,?,0,?,?,?,?,1)";
		pstmt = con.prepareStatement(sql2); 
		pstmt.setString(1,memName);
		pstmt.setString(2,bean.getSenderTitle());
		pstmt.setString(3,  bean.getSenderContents());
		pstmt.setString(4, bean.getSender());
		pstmt.setString(5, bean.getDate());
		pstmt.setString(6, bean.getKind());
		pstmt.setInt(7, send_idx);
		pstmt.setString(8, bean.getAdd_title());
		pstmt.setString(9, bean.getAdd_contents());
		pstmt.setString(10,bean.getReceiver());

		pstmt.executeUpdate(); 
		
	}
	
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
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
	sql = "update db.receivemail set count=count+1 where idx=?";
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
	public void reportCount(int num) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try {
	con = pool.getConnection();
	sql = "update db.receivemail set report=report+1 where idx=?";
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
	
	public int getReportCount(String id) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String sql2 = null; 

		int report = 0; 
		try { 
			con = pool.getConnection(); 
				sql = "select count(*) from db.receivemail where report='0' and receiver=?"; 
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, id);
				
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				report = rs.getInt(1);
				} 
			
		
			} catch (Exception e) { e.printStackTrace(); 
			} finally { 
				if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
				if (pstmt != null) try{ pstmt.close(); 
				}catch(SQLException ex) {} 
				if (con != null) try{ con.close(); }catch(SQLException ex) {} 
		} return report; 
		}
	
	public String getSelectRepoter(int idx) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String sql2 = null; 

		String report = null; 
		try { 
			con = pool.getConnection(); 
				sql = "select repoter from db.receivemail where idx=?"; 
				pstmt = con.prepareStatement(sql); 
				pstmt.setInt(1, idx);
				
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				report = rs.getString(1);
				} 
			
		
			} catch (Exception e) { e.printStackTrace(); 
			} finally { 
				if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
				if (pstmt != null) try{ pstmt.close(); 
				}catch(SQLException ex) {} 
				if (con != null) try{ con.close(); }catch(SQLException ex) {} 
		} return report; 
		}
}

	
	
	
	

