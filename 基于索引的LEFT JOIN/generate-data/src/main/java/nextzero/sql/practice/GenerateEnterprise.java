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
 * 产生企业数据
 * id: 1-10000，表示企业
 */
public class GenerateEnterprise {

    public static void main(String[] args) throws Exception {
        FileInputStream confInputStream = new FileInputStream("mybatis-config.xml");
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(confInputStream);
        SqlSession session = factory.openSession(true);

        try {
            CommonMapper mapper = session.getMapper(CommonMapper.class);
            List<Map> enterpriseList = new ArrayList<Map>();
            for(int i=1; i<=10000; i++){
                Map enterprise = new HashMap();
                enterprise.put("id", i);
                enterprise.put("type", 0);
                enterprise.put("name", "enterprise"+i);
                enterprise.put("phone", "13689761203");
                enterprise.put("address","银河系");
                enterprise.put("email", "xxx@qq.com");
                enterprise.put("qq", "22222222");
                enterprise.put("enterprise_id", 0);
                enterprise.put("dep_id", 0);
                enterpriseList.add(enterprise);
            }
            mapper.insertEnterprise(enterpriseList);
        }catch (Exception e){
            e.printStackTrace();
        } finally{
            if(null != session){
                session.close();
            }
        }
    }
}
