package ltf_ssm_dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ltf_ssm_entity.entity.T_WorkInfo;

public interface WorkInfMapper {
	
	@Select("select W_Id as id,W_Name as name,W_Brief as brief,W_Img as  img from t_workinfo")
	List<T_WorkInfo> findAll();
	
	@Select("select W_Id as id,W_Name as name,W_Brief as brief,W_Img as  img from t_workinfo where W_Id=#{id}")
	T_WorkInfo findById(int id);
	
	@Update("update t_workinfo set W_Name=#{name},W_Brief=#{brief},W_Img=#{img} where W_Id=#{id}")
	void updateInf(@Param("id") int id, @Param("name") String name,@Param("brief") String brief,@Param("img") String img);

	@Insert("insert into t_workinfo(W_Name,W_Brief,W_Img) values(#{name},#{brief},#{img})")
	void insertInf(@Param("name") String name,@Param("brief")  String brief,@Param("img")  String img);
	
	@Delete("delete from t_workinfo where W_Id=#{id}")
	void deleteInfByID(@Param("id") int id);
}
