package member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import mail.sendBean;

public class LogonDBBean {
	private static LogonDBBean instance = new LogonDBBean(); // ���� ��ü ����

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	public int userCheck(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
				conn = getConnection();
				String orgPass = password;
				pstmt = conn.prepareStatement("select password from member where id= ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
			if (rs.next()) {// �ش� ���̵� ������ ����
				String dbpasswd = rs.getString("password");
				if (dbpasswd.equals(orgPass))
					x = 1; // ��������
				else
					x = 0; // ��й�ȣ Ʋ��
			} else// �ش� ���̵� ������ ����
				x = -1;// ���̵� ����
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

	public boolean pwdCheck(String id, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select password from member where binary(id) = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbpasswd = rs.getString("password");

				if (dbpasswd.equals(password))
					flag = true;
				else
					flag = false;

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
		return flag;
	}

	public int confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select password from member where id = ?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
			if (rs.next()) {// ���̵� ����
				x = 1; // ���� ���̵� ����
			}
			else
				x = -1;// ���� ���̵� ����
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

	public boolean insertMember(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
				conn = getConnection();
				String orgPass = member.getPassword();
				pstmt = conn.prepareStatement("insert into member values (null,?,?,?,0,0)");
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getEmail());
			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
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
		return flag;
	}

	// ȸ�� ���� ���� ��(modifyForm.jsp)�� ���� ���� ���� ������ �������� �޼ҵ�
	public LogonDataBean getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		try {
			conn = getConnection();
			//String orgPass = password;
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {// �ش� ���̵� ���� ���ڵ尡 ����
				String dbpasswd = rs.getString("password"); // ����ڰ� �Է��� ��й�ȣ�� ���̺��� ��й�ȣ�� ������ ����
				String mail = rs.getString("email");
				
				if (dbpasswd.equals(dbpasswd)) {
					member = new LogonDataBean();// ����������� ��ü����
					member.setId(rs.getString("id"));
					member.setPassword(rs.getString("password"));
					member.setEmail(mail);

				}
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
		
		return member;// ������ ����� ��ü member ����
	}

	// ȸ�� ���� ���� ó��(modifyPro.jsp)���� ȸ�� ���� ������ ó���ϴ� �޼ҵ�
	public int updateMember(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
				conn = getConnection();
				pstmt = conn.prepareStatement("update member set password=?, email=?" + "where id=?");
				pstmt.setString(1, member.getPassword());
				pstmt.setString(2, member.getEmail());			
				pstmt.setString(3, member.getId());
			x = pstmt.executeUpdate();// ȸ������ ���� ó�� ����

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
	
	
	
	
	
	public void reportCount(String id) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      String sql2 = null;
      int idx=0;
      ResultSet rs = null; 

      try {
      con = getConnection();
      sql = "select idx from db.member where id=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery(); 
      
      if(rs.next())
      {
         idx = rs.getInt(1);
      }
   
         
      sql2 = "update db.member set report=report+1 where idx=?";
      pstmt = con.prepareStatement(sql2);
      pstmt.setInt(1, idx);
      pstmt.executeUpdate();
      } catch (Exception e) {
      e.printStackTrace();
      } finally {
      if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
      if (con != null) try{ con.close(); }catch(SQLException ex) {}
      }
      }
   
	
	public void reportCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sql2 = null;
		int idx=0;
		ResultSet rs = null; 

		try {
		con = getConnection();
		sql = "select idx from db.member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); 
		
		if(rs.next())
		{
			idx = rs.getInt(1);
		}
   
		   
		sql2 = "update db.member set report_check=report_check+1 where idx=?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
		if (con != null) try{ con.close(); }catch(SQLException ex) {}
		}
		}
	
	public int reportCheck_w(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sql2 = null;
		int idx=0;
		int report=0;
		ResultSet rs = null; 

		try {
		con = getConnection();
		sql = "select idx from db.member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); 
		
		if(rs.next())
		{
			idx = rs.getInt(1);
		}
   
		   
		sql2 = "select report_check from db.member where idx=?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1,idx);
		rs = pstmt.executeQuery(); 
		if(rs.next())
		{
			report = rs.getInt(1);
		}
   
		
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
		if (con != null) try{ con.close(); }catch(SQLException ex) {}
		}  return report; 
		}
	public void ReportMemberDelete(String id) {
		boolean x=false;
		Connection con = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = null;
		
		try {
			con=getConnection();
			sql="delete from db.member where id=?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, id);
			pstmt.executeUpdate(); 
		}catch (Exception e) { e.printStackTrace(); 
		} finally { 
			if (rs != null) try{ rs.close(); }catch(SQLException ex) {} 
			if (pstmt != null) try{ pstmt.close(); 
			}catch(SQLException ex) {} 
			if (con != null) try{ con.close(); }catch(SQLException ex) {} 
	}
		
	}
	
	   //��й�ȣ ã�⼱�ý� ����ڰ� �Է��� ���̵�� �̸����� �����ϴ��� Ȯ��
	   public int forgetPW(String id, String email){
	         Connection conn = null; 
	         PreparedStatement pstmt = null;
	          ResultSet rs= null; 
	          int x=-1; //�������� ����
	          try { 
	             conn = getConnection(); 
	             String orgemail = email;
	                   pstmt=conn.prepareStatement("select email from db.member where id = ?");
	                   pstmt.setString(1,id);
	                   rs=pstmt.executeQuery();
	                   if(rs.next()){ 
	                      String dbemail= rs.getString("email");
	                      if(dbemail.equals(orgemail)){
	                         x= 1;//ȸ��Ȯ��
	                         }else x= 0;//�̸��� ����ġ
	                      } 
	                   } catch(Exception ex) { 
	                      ex.printStackTrace(); 
	                      } finally { if (rs != null) try { 
	                         rs.close(); } 
	                      catch(SQLException ex) {} 
	                      if (pstmt != null) try {
	                         pstmt.close(); } 
	                      catch(SQLException ex) {} 
	                      if (conn != null) 
	                         try { conn.close();
	                         } catch(SQLException ex) {}
	                      } return x; 
	                      }
	   

	public boolean updatePW(String id, String pw) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    boolean x=false;
	    try {
	       conn = getConnection();
	       pstmt = conn.prepareStatement("update db.member set password=? where id=?");
	       pstmt.setString(1,pw);
		   pstmt.setString(2, id);
	       pstmt.executeUpdate();
	       x=true;
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
	
	// ȸ�� Ż�� ó��(deletePro.jsp)���� ȸ�� ������ �����ϴ� �޼ҵ�
	public int deleteMember(String id, String password){
		Connection conn = null; 
		PreparedStatement pstmt = null;
	    ResultSet rs= null; 
	    int x=-1; 
	    try { 
	    	conn = getConnection(); 
	    	String orgPass = password;
	    			pstmt=conn.prepareStatement("select password from db.member where id = ?");
	    			pstmt.setString(1,id);
	    			rs=pstmt.executeQuery();
	    			if(rs.next()){ 
	    					String dbpasswd= rs.getString("password");
	    				if(dbpasswd.equals(orgPass)){
	    					pstmt = conn.prepareStatement("delete from db.member where id=?");
	    					pstmt.setString(1, id)
	    					; pstmt.executeUpdate(); 
	    					x= 1;//ȸ��Ż��ó�� ����
	    					}else x= 0;//ȸ��Ż�� ó�� ����
	    				} 
	    			} catch(Exception ex) { 
	    				ex.printStackTrace(); 
	    				} finally { if (rs != null) try { 
	    					rs.close(); } 
	    				catch(SQLException ex) {} 
	    				if (pstmt != null) try {
	    					pstmt.close(); } 
	    				catch(SQLException ex) {} 
	    				if (conn != null) 
	    					try { conn.close();
	    					} catch(SQLException ex) {}
	    				} return x; 
	    				}
	

	public int reportThree(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sql2 = null;
		int idx=0;
		int report=0;
		ResultSet rs = null; 

		try {
		con = getConnection();
		sql = "select idx from db.member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); 
		
		if(rs.next())
		{
			idx = rs.getInt(1);
		}
   
		   
		sql2 = "select report from db.member where idx=?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1,idx);
		rs = pstmt.executeQuery(); 
		if(rs.next())
		{
			report = rs.getInt(1);
		}
   
		
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
		if (con != null) try{ con.close(); }catch(SQLException ex) {}
		}  return report; 
		}
	    			
public int getTotalCount() {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	int totalCount = 0;
	try {
		con = getConnection();
		sql = "select count(idx) from db.member";
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

public Vector<LogonDataBean> getUserList(int start, int end) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	Vector<LogonDataBean> vlist = new Vector<LogonDataBean>();
	try {
		con = getConnection(); // DB

		sql = "select * from db.member order by idx desc, idx limit ?,?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			LogonDataBean bean = new LogonDataBean();
			bean.setIdx(rs.getInt("idx"));
			bean.setId(rs.getString("id"));
			bean.setPassword(rs.getString("password"));
			bean.setEmail(rs.getString("email"));
			bean.setReport(rs.getInt("report"));
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

}
