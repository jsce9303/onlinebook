package membership;

import test.db.JDBConnect2;

public class MemberDAO extends JDBConnect2 {
	// 명시한 데이터베이스 연결이 완료된 MmeberDAO 객체를 생성
	public MemberDAO(String driver, String url, String id, String passwd) {
		super(driver, url, id, passwd);
	}
	
	// 명시한 아이디/비밀번호와 일치하는 회원 정보를 반환한다.
    public MemberDTO getMemberDTO(String id, String passwd) {

		MemberDTO dto = new MemberDTO(); 	// 회원 정보 DTO 객체 생성
		String query = " SELECT * FROM member2 WHERE id=? AND passwd=?";
		String realTime = "UPDATE member2 SET lasttime=now() WHERE id=?";
		
		try {
			// 쿼리 실행
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);		// 쿼리문 첫 번째 인파리미터
			pstmt.setString(2, passwd);	// 쿼리문 두 번째 인파라미터
			rs = pstmt.executeQuery();		// 쿼리문 실행
			
			if (rs.next()) {
				// 쿼리 결과로 가져온 회원 정보를 DTO 객체에 저장1
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("passwd"));
				dto.setEmail(rs.getString("email"));
				dto.setRegidate(rs.getString("regdate"));
				dto.setLevel(rs.getInt("level"));
				dto.setLasttime(rs.getString("lasttime"));
				
				pstmt = conn.prepareStatement(realTime);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				// executeUpdate는 하나의 레코드를 수정할때 사용 , 성공시 결과값이 숫자로 반환
			}
		}
		catch (Exception e) {
			System.out.println("문제 발생!");
			e.printStackTrace();
		}
		
		return dto;		// DTO 객체 반환
	}
}