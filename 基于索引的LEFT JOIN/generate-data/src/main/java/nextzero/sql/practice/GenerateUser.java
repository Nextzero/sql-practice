package nextzero.sql.practice;

import javafx.scene.chart.PieChart;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.FileInputStream;
import java.util.*;

/**
 * 产生用户数据
 */
public class GenerateUser {

    public static void main(String[] args) throws Exception {
        Random random = new Random(System.currentTimeMillis());
        FileInputStream confInputStream = new FileInputStream("mybatis-config.xml");
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory factory = builder.build(confInputStream);
        SqlSession session = factory.openSession(true);

        try {
            CommonMapper mapper = session.getMapper(CommonMapper.class);
            /**
             * 追加用户，随机所属部门和企业
             */
            int scopeDepId = DataConfig.DEP_ID_END - DataConfig.DEP_ID_BEGIN;
            int scopeEnterpriseId = DataConfig.ENTERPRISE_ID_END - DataConfig.ENTERPRISE_ID_BEGIN;

            for(int i=0; i<DataConfig.USER_COUNT; i=i+DataConfig.BATCH_COUNT){
                List<Map> userList = new ArrayList<Map>();
                for(int j=0; j<DataConfig.BATCH_COUNT; j++) {
                    Map user = new HashMap();
                    user.put("type", 1);
                    user.put("name", "user" + i);
                    user.put("phone", "13689761203");
                    user.put("address", "维多得大厦");
                    user.put("email", "xxx@qq.com");
                    user.put("qq", "22222222");
                    user.put("enterprise_id", random.nextInt(scopeEnterpriseId) + DataConfig.ENTERPRISE_ID_BEGIN);
                    user.put("dep_id", random.nextInt(scopeDepId) + DataConfig.DEP_ID_BEGIN);
                    userList.add(user);
                }
                mapper.insertUser(userList);
            }
        }catch (Exception e){
            e.printStackTrace();
        } finally{
            if(null != session){
                session.close();
            }
        }
    }
}
