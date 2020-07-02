package QnA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mail.sendBean;
import question.answerBean;
import question.answerMgr;

public class QnAMgr {

	private static QnAMgr pool = new QnAMgr();

	public static QnAMgr getInstance() {
		return pool;
	}

	public QnAMgr() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	public boolean insertQnA(QnABean bean) {// QnA작성
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql1 = null;
	      String sql2 = null;
	      String sql3 = null;
	      boolean x = false;
	      try {
	         conn = getConnection();
	      

	         sql1 = "insert into db.qna values(null,?,?,?,?,?,?,?,0,0,0)";
	         pstmt = conn.prepareStatement(sql1);
	         pstmt.setString(1, bean.getMemberidx());
	         pstmt.setString(2, bean.getContents());
	         pstmt.setString(3, bean.getTitle());
	         pstmt.setString(4, bean.getDate());
	         pstmt.setInt(5, bean.getViewing());
	         pstmt.setInt(6, bean.getSecret());
	         pstmt.setString(7, bean.getPassword());
	         pstmt.executeUpdate();
	         
	         sql2 = "select max(idx) from db.qna";
	         pstmt = conn.prepareStatement(sql2);
	         rs = pstmt.executeQuery();
	         int ref = 1;
	         if (rs.next()) {
	            ref = rs.getInt(1);
	         }
	         
	         sql3="update db.qna set ref=? where idx=?";
	         pstmt = conn.prepareStatement(sql3);
	         pstmt.setInt(1, ref);
	         pstmt.setInt(2, ref);
	         pstmt.executeUpdate();
	         
	         x = true;

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

	public Vector<QnABean> getQnAList(int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<QnABean> vlist = new Vector<QnABean>();
		try {
			con = pool.getConnection(); // DB

			sql = "select * from db.qna where depth=0 order by ref desc, pos limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnABean bean = new QnABean();
				bean.setIdx(rs.getInt("idx"));
				bean.setMemberidx(rs.getString("memberidx"));
				bean.setContents(rs.getString("contents"));
				bean.setTitle(rs.getString("title"));
				bean.setDate(rs.getString("date"));
				bean.setViewing(rs.getInt("viewing"));
				bean.setSecret(rs.getInt("secret"));
				bean.setPassword(rs.getString("password"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
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
			sql = "select count(idx) from db.qna where depth=0";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
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
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return totalCount;
	}

	public QnABean getQnAContents(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		QnABean bean = new QnABean();
		try {
			con = pool.getConnection();
			sql = "select * from db.qna where idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setIdx(rs.getInt("idx"));
				bean.setMemberidx(rs.getString("memberidx"));
				bean.setContents(rs.getString("contents"));
				bean.setTitle(rs.getString("title"));
				bean.setDate(rs.getString("date"));
				bean.setViewing(rs.getInt("viewing"));
				bean.setSecret(rs.getInt("secret"));
				bean.setPassword(rs.getString("password"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));

			}

		} catch (Exception e) {
			e.printStackTrace();
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
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return bean;
	}

	public void upViewing(int idx) {// 조회수 증가
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("update db.qna set viewing=viewing+1 where idx=?");
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}

	public String getPassword(int idx) {//비밀글 여부와 비밀번호를 받아온다
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		String password=null;
		int secret=0;
		try {
			con=pool.getConnection();
			sql="select secret, password from db.qna where idx=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) { 
				
				secret=rs.getInt("secret");
				password=rs.getString("password");
				
				} 
			if(secret==0) {
					password="0";
				}
			
			
		}catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); 
			}catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
	}
		
		return password;
	}

	public boolean reply(QnABean bean) {//답변작성
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= null;
		boolean result=false;
		try{
		con= pool.getConnection();
		sql= "insert into db.qna values(null,?,?,?,?,?,?,?,?,?,?)";
		int depth= bean.getDepth() + 1;
		int pos= bean.getPos() + 1;
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, bean.getMemberidx());
		pstmt.setString(2, bean.getContents());
		pstmt.setString(3, bean.getTitle());
		pstmt.setString(4, bean.getDate());
		pstmt.setInt(5, bean.getViewing());
		pstmt.setInt(6, bean.getSecret());
		pstmt.setString(7, bean.getPassword());
		pstmt.setInt(8, pos);
		pstmt.setInt(9, bean.getRef());
		pstmt.setInt(10, depth);
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
	
	
	public void replyUp(int ref,int pos) {//답변작성
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= null;
		try{
		con= pool.getConnection();
		sql= "update db.qna set pos=pos+1 where ref=? and pos > ?";

		pstmt= con.prepareStatement(sql);
		pstmt.setInt(1, ref);
		pstmt.setInt(2, pos);
		pstmt.executeUpdate();
		} catch(Exception e) {
		e.printStackTrace();
		} finally{
		if(rs!= null) try{ rs.close(); }catch(SQLException ex) {}
		if(pstmt!= null) try{ pstmt.close(); }catch(SQLException ex) {}
		if(con!= null) try{ con.close(); }catch(SQLException ex) {}
		}
		}
	
	public int getReplyCount(int ref) {//비밀글 여부와 비밀번호를 받아온다
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		int result=0;
		try {
			con=pool.getConnection();
			sql="select count(*) from db.qna where ref=? and depth>0";
			pstmt = con.prepareStatement(sql); 
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) { 
				
				result = rs.getInt(1);
				
				
				} 
		
			
		}catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); 
			}catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
	}
		
		return result;
	}
	
	
	public Vector<QnABean> getReplyList(int ref,int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<QnABean> vlist = new Vector<QnABean>();
		try {
			con = pool.getConnection(); // DB

			sql = "select * from db.qna where pos>0 and ref=? order by pos desc, pos limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				QnABean bean = new QnABean();
				bean.setIdx(rs.getInt("idx"));
				bean.setMemberidx(rs.getString("memberidx"));
				bean.setContents(rs.getString("contents"));
				bean.setTitle(rs.getString("title"));
				bean.setDate(rs.getString("date"));
				bean.setViewing(rs.getInt("viewing"));
				bean.setSecret(rs.getInt("secret"));
				bean.setPassword(rs.getString("password"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				vlist.add(bean);
				System.out.println("bean추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
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
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return vlist;
	}
	
	
	
	
	public boolean deleteQnA(int idx) {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= null;
		boolean result=false;
		try{
		con= pool.getConnection();
		sql= "delete from db.qna where idx=?";
		pstmt= con.prepareStatement(sql);
		pstmt.setInt(1, idx);
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
	
	public boolean updateQnA(QnABean bean) {
		Connection con= null;
		PreparedStatement pstmt= null;
		ResultSet rs= null;
		String sql= null;
		boolean result=false;
		try{
		con= pool.getConnection();
		sql= "update db.qna set title=?,contents=?,password=? where idx=?";
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, bean.getTitle());
		pstmt.setString(2,bean.getContents());
		pstmt.setString(3,bean.getPassword());
		pstmt.setInt(4, bean.getIdx());
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
