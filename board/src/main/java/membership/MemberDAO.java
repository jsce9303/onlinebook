package membership;

import test.db.JDBConnect2;

public class MemberDAO extends JDBConnect2 {
	// ����� �����ͺ��̽� ������ �Ϸ�� MmeberDAO ��ü�� ����
	public MemberDAO(String driver, String url, String id, String passwd) {
		super(driver, url, id, passwd);
	}
	
	// ����� ���̵�/��й�ȣ�� ��ġ�ϴ� ȸ�� ������ ��ȯ�Ѵ�.
    public MemberDTO getMemberDTO(String id, String passwd) {

		MemberDTO dto = new MemberDTO(); 	// ȸ�� ���� DTO ��ü ����
		String query = " SELECT * FROM member2 WHERE id=? AND passwd=?";
		
		try {
			// ���� ����
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);		// ������ ù ��° ���ĸ�����
			pstmt.setString(2, passwd);	// ������ �� ��° ���Ķ����
			rs = pstmt.executeQuery();		// ������ ����
			
			if (rs.next()) {
				// ���� ����� ������ ȸ�� ������ DTO ��ü�� ����
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("passwd"));
				dto.setEmail(rs.getString("email"));
				dto.setRegidate(rs.getString("regdate"));
				dto.setLevel(rs.getInt("level"));
			}
		}
		catch (Exception e) {
			System.out.println("���� �߻�!");
			e.printStackTrace();
		}
		
		return dto;		// DTO ��ü ��ȯ
	}
}