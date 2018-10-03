package sklep;

import java.sql.*;

public class Baza {
	public static void main(String[] args) throws SQLException {

	    Statement statement = null;
	    Connection connection = null;
	  
	    try {
	        Class.forName("org.postgresql.Driver");

         //  "jdbc:postgresql://nazwahosta:port/nazwabazy","uzytkownik", "haslo"
         connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/sklep","sklep","");

         String selectTableSQL = "SELECT datname, datallowconn FROM pg_database;";
         statement = connection.createStatement();

         System.out.println(selectTableSQL);

         // wykonywanie SQL
         ResultSet rs = statement.executeQuery(selectTableSQL);

         while (rs.next()) {

             String databaseName = rs.getString("datname");
             String allowConnection = rs.getString("datallowconn");
             
             System.out.println("Database Name : " + databaseName);
             System.out.println("Allow Connection: " + allowConnection);

         }
     } catch (ClassNotFoundException e) {

         e.printStackTrace();
         System.out.append("Nie masz sterownika");
     }
     catch (SQLException e )
     {
         e.printStackTrace();
         System.out.append("Zle dane");
     }
	  finally {
	        if (statement != null) {
	            statement.close();
	        }

	        if (connection != null) {
	            connection.close();
	        }
	    }
	}
}


