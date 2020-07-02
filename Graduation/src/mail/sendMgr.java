package mail;
import java.io.*;
import java.sql.*;
import java.util.Vector;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;


public class sendMgr {

	private static sendMgr pool = new sendMgr();

	public static sendMgr getInstance() {
		return pool;
	}

	public sendMgr() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return  ds.getConnection();
	}

	public Vector<sendBean> getSendList(String id, String kind, int start, int end ) { 
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		Vector<sendBean> vlist = new Vector<sendBean>(); 
		try { con = pool.getConnection(); // DB 
	
			sql = "select * from db.sendmail where senderIdx=? and kind=? order by idx desc limit ?, ?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); 
			pstmt.setString(2, kind); 
			pstmt.setInt(3, start); 
			pstmt.setInt(4, end); 
			
		rs = pstmt.executeQuery();
		while (rs.next()) { 
			sendBean bean = new sendBean();
			bean.setIdx(rs.getInt("idx"));
			bean.setSender(rs.getString("senderIdx")); 
			bean.setSenderTitle(rs.getString("senderTitle")); 
			bean.setSenderContents(rs.getString("senderContents")); 
			bean.setDate(rs.getString("date_")); 
			bean.setReceiver(rs.getString("receiver")); 
			vlist.add(bean); 
			}
		} catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
			} return vlist; 
			}
	
	
	public int getTotalCount(String id,String kind) { 
	Connection con = null; 
	PreparedStatement pstmt = null; 
	ResultSet rs = null; 
	String sql = null; 
	int totalCount = 0; 
	try { 
		con = pool.getConnection(); 
			sql = "select count(idx) from db.sendmail where senderIdx=? and kind=?"; 
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
	
	
	public String randomMember(String id) {
		String memName=null;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null; 
		try {
			con=pool.getConnection();
			sql="select id from db.member where id not in (?,'rhksflwk') order by rand() limit 1";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				memName = rs.getString(1);
				} 
		} catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); 
			}catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
	}
		
		return memName;
	}
	
	
	
	public boolean sendMail(sendBean bean) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String sql2=null;
		String sql3=null;

		
		sendMgr sMgr=new sendMgr();
		String memName=sMgr.randomMember(bean.getSender());
		try {
			con=pool.getConnection();
			sql="insert into db.sendmail values(null,?,?,?,?,null,null,null,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, bean.getSender());
			pstmt.setString(2,memName);
			pstmt.setString(3, bean.getSenderTitle());
			pstmt.setString(4, bean.getSenderContents());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getKind());
			pstmt.setString(7, bean.getAdd_title());
			pstmt.setString(8, bean.getAdd_contents());

			pstmt.executeUpdate(); 
			
			sql2="select max(idx) from db.sendmail";
			pstmt = con.prepareStatement(sql2); 
			int send_idx=0;
			
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				send_idx=rs.getInt(1);
			}
			
			sql3="insert into db.receivemail value(null,?,?,?,?,null,null,null,?,?,?,?,?,?,null,0)";
			pstmt = con.prepareStatement(sql3); 
			pstmt.setString(1,memName);
			pstmt.setString(2,bean.getSenderTitle());
			pstmt.setString(3,  bean.getSenderContents());
			pstmt.setString(4, bean.getSender());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getKind());
			pstmt.setString(7, bean.getCount());
			pstmt.setInt(8, send_idx);
			pstmt.setString(9, bean.getAdd_title());
			pstmt.setString(10, bean.getAdd_contents());

			

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
	
	
	
	
	public boolean receiveMail(sendBean bean, String receiver) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql=null;
		String sql2=null;
		sendMgr sMgr=new sendMgr();
		try {
			con=pool.getConnection();
			sql="insert into db.sendmail values(null,?,?,?,?,null,null,null,?,?,?,?,0)";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, bean.getSender());
			pstmt.setString(2,receiver);
			pstmt.setString(3, bean.getSenderTitle());
			pstmt.setString(4, bean.getSenderContents());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getKind());
			pstmt.setString(7, bean.getAdd_title());
			pstmt.setString(8, bean.getAdd_contents());

			pstmt.executeUpdate(); 
			
		
			sql2="insert into db.receivemail value(null,?,?,?,?,null,null,null,?,?,?,?,?,?,null,0)";
			pstmt = con.prepareStatement(sql2); 
			pstmt.setString(1,receiver);
			pstmt.setString(2,bean.getSenderTitle());
			pstmt.setString(3,  bean.getSenderContents());
			pstmt.setString(4, bean.getSender());
			pstmt.setString(5, bean.getDate());
			pstmt.setString(6, bean.getKind());
			pstmt.setString(7,bean.getCount());
			pstmt.setString(8,bean.getSend_idx());
			pstmt.setString(9,bean.getAdd_title());
			pstmt.setString(10,bean.getAdd_contents());

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
	
	
	
	
	public sendBean getsendContents(int idx) {
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		sendBean bean=new sendBean();
		try {
			con=pool.getConnection();
			sql="select * from db.sendmail where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				bean.setIdx(rs.getInt("idx"));
				bean.setSender(rs.getString("senderIdx"));
				bean.setReceiver(rs.getString("receiver"));
				bean.setSenderContents(rs.getString("senderContents"));
				bean.setSenderTitle(rs.getString("senderTitle"));
				bean.setDate(rs.getString("date_"));
				bean.setKind(rs.getString("kind"));
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
	
	
	
	
	public sendBean getsendWorry(int idx) {
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String sql2 = null;
		int send_idx=0;
		sendBean bean=new sendBean();
		try {
			con=pool.getConnection();
			sql="select send_idx from db.receivemail where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				send_idx=rs.getInt(1);
			}
			sql2="select * from db.sendmail where idx=?";
			pstmt = con.prepareStatement(sql2); 
			pstmt.setInt(1, send_idx);
			rs = pstmt.executeQuery(); 

			if (rs.next()) { 
				bean.setSender(rs.getString("senderIdx"));
				bean.setReceiver(rs.getString("receiver"));
				bean.setSenderContents(rs.getString("senderContents"));
				bean.setSenderTitle(rs.getString("senderTitle"));
				bean.setDate(rs.getString("date_"));
				bean.setKind(rs.getString("kind"));

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
	
	public boolean sendDelete(int idx) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		sendBean bean=new sendBean();
		try {
			con=pool.getConnection();
			sql="delete from db.sendmail where idx=?";
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
	
}
	
	
	

