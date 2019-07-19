package ltf_ssm_service.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ltf_ssm_api.service.UserService;
import ltf_ssm_dao.mapper.UserMapper;
import ltf_ssm_dao.mapper.WorkInfMapper;
import ltf_ssm_entity.entity.T_User;
import ltf_ssm_entity.entity.T_WorkInfo;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private WorkInfMapper workInfMapper;

	@Override
	public int login(String name, String pass) {
		return userMapper.findUserByNameAndPwd(name, pass);
	}

	@Override
	public void reg(T_User user) {
		userMapper.reg(user);
	}

	@Override
	public int findUserByEmial(String Email) {
		return userMapper.findUserByEmail(Email);
	}

	@Override
	public void changePasswordByUsername(String password, String username) {
		userMapper.changePasswordByUsername(password, username);
	}

	@Override
	public int findUser(String userName) {
		return userMapper.findUserByName(userName);
	}
	
	@Override
	public List<T_WorkInfo> findAll(){
		return workInfMapper.findAll();
	}
	
	@Override
	public T_WorkInfo findById(int id) {
		return workInfMapper.findById(id);
	}

	@Override
	public void updateInf(int id, String name, String brief, String img) {
		workInfMapper.updateInf(id,name,brief,img);
		
	}

	@Override
	public void insertInf(String name, String brief, String img) {
		workInfMapper.insertInf(name, brief, img);
	}

	@Override
	public void deleteInfByID(int id) {
		workInfMapper.deleteInfByID(id);
	}

	@Override
	public void changePasswordByEmail(String password, String email) {
		userMapper.changePasswordByEmail(password, email);
	}
	
}
