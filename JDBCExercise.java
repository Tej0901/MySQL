package jdbcExercise;
import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;


class StudentDetails
{
	public ArrayList<String> studentID = new ArrayList<String>();
	public ArrayList<String> studentName = new ArrayList<String>();
	public ArrayList<String> studentStd = new ArrayList<String>();
	public ArrayList<Integer> studentAge = new ArrayList<Integer>();
	
	public void setRecords(Object stud,ResultSet rSet) throws SQLException
	{
		((StudentDetails) stud).setStudentID(rSet);	
		((StudentDetails) stud).setStudentName(rSet);
		((StudentDetails) stud).setStudentStd(rSet);
		((StudentDetails) stud).setStudentAge(rSet);
//		((StudentDetails) stud).getStudentDetails();
		System.out.println("Added!!! \n");
	}
	
	public void setStudentID(ResultSet rSet) throws SQLException
	{
		studentID.clear();
		while(rSet.next())
		{
		String ID = rSet.getString(1);
		studentID.add(ID);
//		System.out.println(studentID);
		}
	}
	
	public void setStudentName(ResultSet rSet) throws SQLException
	{
		studentName.clear();
		rSet.beforeFirst();
		while(rSet.next())
		{
		String name = rSet.getString(2);
		studentName.add(name);
//		System.out.println(studentName);
		}
	}
	
	public void setStudentStd(ResultSet rSet) throws SQLException
	{
		studentStd.clear();
		rSet.beforeFirst();
		while(rSet.next())
		{
		String std = rSet.getString(3);
		studentStd.add(std);
		}
	}
	
	public void setStudentAge(ResultSet rSet) throws SQLException
	{
		studentAge.clear();
		rSet.beforeFirst();
		while(rSet.next())
		{
		int age = rSet.getInt(4);
		studentAge.add(age);
		}
	}
	
	public void getStudentDetails()
	{
		int idIndex=0;
		System.out.println();
//		int nameIndex=0,stdIndex=0,ageIndex=0;
		while (idIndex < studentID.size()) 
		{
			System.out.println(studentID.get(idIndex)+","
			+studentName.get(idIndex)+","
			+studentStd.get(idIndex)+","
			+studentAge.get(idIndex));
			idIndex++;
		}
	}
	
//	public void updateDetails(String ID,String Name)
//	{
//		int index = studentID.indexOf(ID);
//		System.out.println();
//		studentName.set(index, Name);
//	}
}

public class MysqlExercise 
{
	public static void main(String[] args)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/MysqlDatabase";
			String userName = "root";
			String userPassword = "teja0901";
			Connection con = DriverManager.getConnection(url, userName, userPassword);
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			StudentDetails stud = new StudentDetails();
			String query1 = "SELECT * FROM StudentDetails";
//			ResultSet rSet = stmt.executeQuery(query1);
			
			Scanner reader = new Scanner(System.in);
			
			while(true)
			{
				System.out.println("1. Set all records from database and store in Lists"
						+ "\n2. Update records in database"
						+ "\n3. Delete records in database"
						+ "\n4. Display Student Details"
						+ "\n5. Exit");
				String choice=reader.nextLine();
				switch (choice) 
				{
					case "1": 
					{
						ResultSet rSet = stmt.executeQuery(query1);
						stud.setRecords(stud,rSet);
						rSet.close();
						break;
					}
					case "2":
					{
						String query3 = "UPDATE StudentDetails SET StudentName=? WHERE ID=?";
						PreparedStatement stmt2 = con.prepareStatement(query3);
						System.out.println("enter the name:");
						String name=reader.nextLine();
						System.out.println("enter the ID:");
						String ID = reader.nextLine();
						stmt2.setString(1, name);
						stmt2.setString(2,ID);
						int i = stmt2.executeUpdate();
						System.out.println("\n"+i+" rows updated!!!");
						
						ResultSet rSet2 = stmt.executeQuery(query1);
						stud.setRecords(stud, rSet2);
						rSet2.close();
						stmt2.close();
						break;
					}
					case "3":
					{
						String query4 = "DELETE FROM StudentDetails WHERE ID=?";
						PreparedStatement stmt2 = con.prepareStatement(query4);
						System.out.println("enter the ID:");
						String ID = reader.nextLine();
						stmt2.setString(1, ID);
						int i = stmt2.executeUpdate();
						System.out.println("\n"+i+" rows updated");
						
						ResultSet rSet3 = stmt.executeQuery(query1);
						stud.setRecords(stud, rSet3);
						rSet3.close();
						stmt2.close();
						break;
					}
					case "4":
					{
						stud.getStudentDetails();
						break;
					}
					case "5":
					{
						stmt.close();
						con.close();
						System.exit(0);
					}
					default:
					{
						throw new IllegalArgumentException("Unexpected value: " + choice);
					}
				}
			}
		}
		catch (Exception e) 
		{
			System.out.println("error Occurred!!! "+e);
		}
	}
}
