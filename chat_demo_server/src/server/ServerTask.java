package server;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;


public class ServerTask implements Runnable {

	Socket client;	
	
	Hashtable<String,PrintWriter> ht;
	
	ServerController sc;
	
	PrintWriter pw;		
	BufferedReader br;	
	
	String nickName;	
	
	boolean isRun = true;
	
	boolean result = true;
	
	
	public ServerTask(
			Socket client, 
			Hashtable<String,PrintWriter> ht,
			ServerController sc) {
		this.client = client;
		this.ht = ht;
		this.sc = sc;
		
		try {
			OutputStream os = client.getOutputStream();
			OutputStreamWriter osw = new OutputStreamWriter(os);
			BufferedWriter bw = new BufferedWriter(osw);
			pw = new PrintWriter(bw,true);
			
			InputStream is = client.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			br = new BufferedReader(isr);
			
		} catch (IOException e) {
			sc.displayText("Client 연결 오류 : "+e.getMessage());
		}
		
	}


	@Override
	public void run() {
		System.out.println("Client의 receive 시작");
		while(isRun) {
				try {
					String receiveData = br.readLine();
					if(receiveData == null) {
						isRun = false;
					}
					System.out.println(receiveData);
					
					String[] data = receiveData.split("\\|");

					String code = data[0];
					System.out.println(code);
					String id = data[1];
					System.out.println(id);
					String pwd = data[2];
					System.out.println(pwd);
					switch(code) {
						case "1" :
							logIn(id,pwd);
							break;
						case "2" :
							break;
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
	
		} // end while
		
		if(client != null && !client.isClosed()) {
			try {
				client.close();
			} catch (IOException e) {}
		}
		
		ht.remove(nickName);
		String list ="";
		for(String s : ht.keySet()) {
			list+= s+",";
		}
		broadCast(0,list);		
		broadCast(1,nickName+"님이 나가셨습니다.");
		
	}// end Run
	public void broadCast(int code, String message) {
		for(PrintWriter p : ht.values()) {
			p.println(code+"|"+message);
		}
	}
	
	public void logIn(String id, String pwd) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/catchmind";
		String user = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			System.out.println("성공");
			String sql = "SELECT mID, mPw FROM userTbl WHERE mID = ? AND mPw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw.println("1");
			}else {
				pw.println("2");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	};

}












