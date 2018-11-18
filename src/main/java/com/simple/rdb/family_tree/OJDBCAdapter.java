package com.simple.rdb.family_tree;

public class OJDBCAdapter {

	public static boolean verifyDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			return false;
		}
		return true;
	}
	
}
