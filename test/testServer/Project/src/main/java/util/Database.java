package util;

import model.Parameter.Personal;

import java.sql.*;

public class Database {
    public void CheckLogin(Personal personal) {
        Connection connect = null;
        Statement s = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection(Cont.urlConnect);
            s = connect.createStatement();
            String id = personal.getId();
            String username = personal.getUsername();
            String address = personal.getAddress();


            try {
                String sql = " SELECT id " +
                        "FROM  person " +
                        "WHERE id = '" + id + "' " ;
                ResultSet rec = s.executeQuery(sql);
                if(!rec.next()){
                    String login = "INSERT INTO person (id, name,address)  " +
                            "VALUE ('"+id+"','"+username+"','"+address+"')";
                    s.execute(login);
                }
                else {
                    System.out.print(username+","+id);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
