package co.com.enterprise.dojo.acceptancetest.utils;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.util.List;
import java.util.Map;

public class DbUtils {

    private static DbUtils instance;

    private JdbcTemplate jdbc;

    private DbUtils() {
        String urlEndPointDB = System.getProperty("urlEndPointDB");
        String urlCluster = System.getProperty("urlCluster");
        String urlRegion = System.getProperty("urlRegion");
        String userDB = System.getProperty("userDB");
        String passwordDB = System.getProperty("passwordDB");
        String portBD = System.getProperty("portBD");
        String dbName = System.getProperty("dbName");
        String driverClassName = "org.postgresql.Driver";
        String url = "jdbc:postgresql://" + urlEndPointDB +"." + urlCluster +"."+urlRegion+ ".rds.amazonaws.com:" + portBD + "/" + dbName
                + "?useSSL=false&allowPublicKeyRetrieval=true";
        System.out.println("urldb funca?"+url);
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driverClassName);
        dataSource.setUrl(url);
        dataSource.setUsername(userDB);
        dataSource.setPassword(passwordDB);
        this.jdbc = new JdbcTemplate(dataSource);
    }

    public static DbUtils getInstance() {
        if (instance == null) {
            instance = new DbUtils();
        }
        return instance;
    }

    public void executeQuery(String query) {
        jdbc.update(query);
    }

    public Object readValue(String query) {

        return jdbc.queryForObject(query, Object.class);
    }

    public Map<String, Object> readRow(String query) {

        return jdbc.queryForMap(query);
    }

    public List<Map<String, Object>> readRows(String query) {

        return jdbc.queryForList(query);
    }


    public int update(String query) {
        return jdbc.update(query);
    }

}