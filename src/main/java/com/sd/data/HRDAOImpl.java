package com.sd.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HRDAOImpl implements HRDAO {
	private static String url = "jdbc:mysql://localhost:3306/employeedb";
	private String user = "alhrmgr";
	private String pass = "hruser";
	
	public HRDAOImpl() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("Error loading MySQL Driver!!!");
		}
	}

	@Override
	public Employee getEmployeeById(int id) {
		Employee emp = null;
		
		String sql = "Select id, first_name, last_name, address_id, date_of_birth,  "
				try {
					Connection conn = DriverManager.getConnection(url, user, pass);
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, id);
					ResultSet rs = stmt.executeQuery();

					if (rs.next()) {
						emp = new Employee(rs.getInt(1); 

					}

					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return emp;
			}

	@Override
	public Employee addEmployee(Employee newEmp) {

		String title = newEmp.getTitle();
		

		String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating) "
				+ " VALUES (?,?,?,?,?,?,?,?,?)";

		String sql2 = "SELECT LAST_INSERT_ID()";

		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql); // or (sql, Statement.RETURN_GENERATED_KEYS);)

			stmt.setString(1, title);
			

			int uc = stmt.executeUpdate();
			if (uc > 0) {
				ResultSet rs = stmt.executeQuery(sql2); // or stmt.getGeneratedKeys();
				if (rs.next()) {
					newEmp.setId(rs.getInt(1));
				}
			}
			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return newEmp;
	}

	@Override
	public Employee updateEmployee(Employee emp) {
		Integer id = film.getId();
        
        String sql = "UPDATE film SET title = ?,  description = ?, release_year = ?, language_id = ?, rental_duration = ?, rental_rate = ?, length = ?, replacement_cost = ?,  rating = ? WHERE id = ?";

        String sql2 = "SELECT LAST_INSERT_ID()";

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, title);
            
            stmt.setInt(10, id);
            
            int uc = stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }

	@Override
	public String deleteEmployee(Employee emp) {
		String response = null;
        String sql = "DELETE FROM film WHERE id = ?";

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            int uc = stmt.executeUpdate();
            if (uc > 0 ) {
                response = "Employee Deleted!";
            }
            else {
                response = "No Such Employee Found!";
            }
            
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response = "Unable to delete Employee!";
        }
        return response;
    }

	@Override
	public List<Employee> listEmployees() {
		List<Employee> empList = new ArrayList<>();
		Employee emp = null;
        String sql = "SELECT * FROM employee";
        try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				emp = new Employee(rs.getInt(1), 
				empList.add(emp);

			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}
	
	@Override
	public List<Employee> listEmployeesActiveOnly() {
		String sql = "SELECT * FROM employee WHERE active = 1";
		return null;
	}

}
