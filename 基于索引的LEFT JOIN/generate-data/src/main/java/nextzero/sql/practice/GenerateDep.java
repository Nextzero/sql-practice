package nextzero.sql.practice;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 产生部门数据
 */
public class GenerateDep {

    /**
     * 数据规律：
     * id:1-1w，表示1w个企业
     * id:1w-100w，表示企业下的用户，并通过enterprise_id字段关联所属企业
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
        FileInputStream confInputStream = new FileInputStream("mybatis-config.xml");
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(confInputStream);
        SqlSession session = factory.openSession(true);

        try {
            CommonMapper mapper = session.getMapper(CommonMapper.class);

            /**
             * id: 10000-20000，表示部门
             */
            List<Map> depList = new ArrayList<Map>();
            for(int i=DataConfig.DEP_ID_BEGIN; i<=DataConfig.DEP_ID_END; i++){
                Map dep = new HashMap();
                dep.put("id", i);
                dep.put("type", 2);
                dep.put("name", "dep"+i);
                dep.put("phone", "13689761203");
                dep.put("address","维多得大厦");
                dep.put("email", "xxx@qq.com");
                dep.put("qq", "22222222");
                dep.put("enterprise_id", 0);
                dep.put("dep_id", 0);
                depList.add(dep);
            }
            mapper.insertDep(depList);
        }catch (Exception e){
            e.printStackTrace();
        } finally{
            if(null != session){
                session.close();
            }
        }
    }
}
