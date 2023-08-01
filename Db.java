package com;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class Db {

	public static Connection getConn() throws ClassNotFoundException,
			SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/dual acess storage", "root", "root");
		return con;

	}
}
