package membership;


//���ٸ� ���� ���� �Ӽ��� �� �Ӽ��� �����ϱ� ���� ����/���� �޼��常 ������� DTO(Data Transfer Object)��� �Ѵ�.
public class MemberDTO {
	//��� ���� ����
	private String id;
	private String pass;
	private String email;
	private String regidate;
	private int	level;
	
	//private ������ ������ get�� set�� ���� �����ؾ� �Ѵ�.
	//��� �������� ���Ϳ� ���� ����
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
