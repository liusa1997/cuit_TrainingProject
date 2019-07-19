package ltf_ssm_dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ltf_ssm_entity.entity.T_User;

public interface UserMapper {
	@Select("select count(*) from T_User where U_Name=#{Name} and U_PassWord=#{PassWord}")
	int findUserByNameAndPwd(@Param("Name") String Name, @Param("PassWord") String PassWord);

	@Insert("insert into t_user(U_Id,U_Name,U_PassWord,U_Email,R_Id)values(default,#{name},#{password},#{email},#{r_id})")
	void reg(T_User user);

	@Select("select count(*) from T_User where U_Email=#{Email}")
	int findUserByEmail(@Param("Email") String Email);
	
	@Update("update T_User set U_PassWord=#{password} where U_Name=#{U_Name} ")
	void changePasswordByUsername(@Param("password") String password, @Param("U_Name") String username);
	
	@Select("select count(*) from T_User where U_Name=#{Name}")
	int findUserByName(@Param("Name") String Name);
	
	@Update("update T_User set U_PassWord=#{password} where U_Email=#{email}")
	void changePasswordByEmail(@Param("password") String password, @Param("email") String email);
}
