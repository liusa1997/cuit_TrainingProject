package ltf_ssm_api.service;

import java.util.List;

import ltf_ssm_entity.entity.T_User;
import ltf_ssm_entity.entity.T_WorkInfo;

public interface UserService {

	int login(String name, String pass);

	int findUser(String userName);

	void reg(T_User user);

	int findUserByEmial(String Email);
	
	void changePasswordByUsername(String password, String username);
	
	void changePasswordByEmail(String password, String email);
	
	List<T_WorkInfo> findAll();

	T_WorkInfo findById(int id);

	void updateInf(int id, String name, String brief, String img);

	void insertInf(String name, String brief, String img);

	void deleteInfByID(int id);
}
