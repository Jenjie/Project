<%@ page import="java.sql.*" %>
<%@ page import="util.Cont" %>
<html>
<head>
    <title>title</title>
</head>
<body>
<table border="1" align="center">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>address</th>
    </tr>
<%
    Connection connect = null;
    Statement s = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connect = DriverManager.getConnection(Cont.urlConnect);
        s = connect.createStatement();
        try {
            String sql = " SELECT * " +
                    "FROM  person " ;
            ResultSet rec = s.executeQuery(sql); %>
        <%
            while ((rec!=null) && rec.next()){ %>
    <tr>
        <td><%=rec.getString("id")%></td>
        <td><%=rec.getString("name")%></td>
        <td><%=rec.getString("address")%></td>
    </tr>
<% } %>
<%       }catch (SQLException e){
            e.printStackTrace();
        }
    } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
%>
</table>
</body>
</html>