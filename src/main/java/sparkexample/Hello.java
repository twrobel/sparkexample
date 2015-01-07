package sparkexample;

import static spark.Spark.get;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Hello {

    public static void main(String[] args) {
        get("/", (req, res) -> {
            return "hello from sparkjava.com " + getPostgresVersion();
        });
    }

    private static String getPostgresVersion() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        String result = "";

    	String addr = System.getenv("DB_PORT_5432_TCP_ADDR");
    	String port = System.getenv("DB_PORT_5432_TCP_PORT");
        String url = "jdbc:postgresql://"+addr+":"+port+"/postgres"; //default database
        String user = System.getenv("POSTGRES_USER");
        String password = System.getenv("POSTGRES_PASSWORD");

        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery("SELECT VERSION()");

            if (rs.next()) {
            	result = rs.getString(1);
            }

        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(Hello.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }

            } catch (SQLException ex) {
                Logger lgr = Logger.getLogger(Hello.class.getName());
                lgr.log(Level.WARNING, ex.getMessage(), ex);
            }
        }

        return result;
    }
}