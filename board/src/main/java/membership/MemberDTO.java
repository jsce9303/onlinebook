package membership;


//별다른 로직 없이 속성과 그 속성에 접근하기 위한 게터/세터 메서드만 갖춘것을 DTO(Data Transfer Object)라고 한다.
public class MemberDTO {
	//멤버 변수 선언
	private String id;
	private String pass;
	private String email;
	private String regidate;
	private int	level;
	
	//private 변수기 때문에 get과 set을 통해 접근해야 한다.
	//멤버 변수마다 게터와 세터 설정
	
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
