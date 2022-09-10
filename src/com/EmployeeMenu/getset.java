package com.EmployeeMenu;


public class getset {
	
	static String name,lname,rde;

	public static String getRde() {
		return rde;
	}

	public static void setRde(String rde) {
		getset.rde = rde;
	}

	public static String getLname() {
		return lname;
	}

	public static void setLname(String lname) {
		getset.lname = lname;
	}

	public static String getName() {
		return name;
	}

	public static void setName(String name) {
		getset.name = name;
	}

	static int eid,did,pid;

	public static int getEid() {
		return eid;
	}

	public static void setEid(int eid) {
		getset.eid = eid;
	}

	public static int getDid() {
		return did;
	}

	public static void setDid(int did) {
		getset.did = did;
	}

	public static int getPid() {
		return pid;
	}

	public static void setPid(int pid) {
		getset.pid = pid;
	}

}

