package jdbc_connect_example;
import java.sql.*;

class Employee
{
	
}

public class JDBCExercise 
{
	public static void main(String[] args) throws Exception
	{
		try 
		{
			String url = "jdbc:mysql://localhost:3306/JDBC_CONNECT";
			String uName = "root";
			String password = "teja0901";
			String query="SELECT EmployeeID,EmployeeName,Age FROM EmployeeDetails WHERE Age<=21";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,uName,password);
			Statement stm = con.createStatement();
			ResultSet rSet=stm.executeQuery(query);
			while(rSet.next())
			{
				System.out.println(rSet.getString("EmployeeID")+"\t"+rSet.getString("EmployeeName")+"\t"+rSet.getInt("Age"));
			}
//			System.out.println(rSet.getString(1)+"\t"+rSet.getString(2)+"\t"+rSet.getInt(3));
			String query2 = "INSERT INTO EmployeeDetails VALUES('pt-7000','Harsha vardhan','2023-01-09',21)";
			int m = stm.executeUpdate(query2);
			if(m==1)
			{
				System.out.println("updated successfully!!!!");
			}
			else
			{
				System.out.println("Not updated !!!!");
			}
			
			String query3 = "INSERT INTO EmployeeDetails VALUES('pt-7001','fahim siddiqui','2022-12-22',22)";
			stm.close();
			con.close();
		} 
		catch (Exception e) 
		{
			System.out.println("Error Has Occurred!!!!"+e);
		}
		
		
	}

}
