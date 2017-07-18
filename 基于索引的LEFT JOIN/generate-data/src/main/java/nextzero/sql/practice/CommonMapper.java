package nextzero.sql.practice;

import java.util.List;
import java.util.Map;

public interface CommonMapper {

    void insertEnterprise(List<Map> params);
    void insertDep(List<Map> params);
    void insertUser(List<Map> params);
}
