package ltf_ssm_entity.entity;

import java.io.Serializable;

public class T_User implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String password;
	private String email;
	private int r_id;

	public T_User() {

	}

	public T_User(String name, String pass, String address, String phone) {
		super();
		this.name = name;
		this.password = pass;
		this.email = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	@Override
	public String toString() {
		return "T_User [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", r_id=" + r_id
				+ "]";
	}

}
