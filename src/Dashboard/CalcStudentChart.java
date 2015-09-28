package Dashboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.sql.DataSource;

public class CalcStudentChart {
	
	public StudentChart calc() {
		int countPass = 0;
		int countProbation = 0;
		int countRetire = 0;
		int countResign = 0;
		int countIntermission_Leave = 0;
		int countGraduate = 0;

		try {
			Connection con = DatabaseConnector.getConnection();
			
			Statement stmt = con.createStatement();
			String academic_year = "SELECT date_key,status_id from dw.personal_status_fact";
			ResultSet res = stmt.executeQuery(academic_year);

			DateFormat dateFormat = new SimpleDateFormat("yyyy");
			Date date = new Date();
			String Academic_YearNow = dateFormat.format(date);

			int Academic_YearInt = Integer.parseInt(Academic_YearNow) - 1;
			String ChkAcademic_YearString = String.valueOf(Academic_YearInt);
			System.out.println("ChkAcademic_YearString : " + ChkAcademic_YearString);

			while (res.next()) {
				String date_keyIndb = res.getString(1);
				System.out.println("date_keyIndb : " + date_keyIndb);

				String date_key = date_keyIndb.split("/")[date_keyIndb.split("/").length - 2];
				System.out.println("date_key : " + date_key);

				if ((ChkAcademic_YearString.equals(date_key))) {
					String Academic_Year = date_key;
					String status_id = res.getString(2);
					// System.out.println("Academic_Year : " + Academic_Year);
					System.out.println("status_id : " + status_id);
					if (status_id.equals("1")) {
						countPass += 1;
					} else if (status_id.equals("2")) {
						countProbation += 1;
					} else if (status_id.equals("2")) {
						countRetire += 1;
					} else if (status_id.equals("3")) {
						countResign += 1;
					} else if (status_id.equals("4")) {
						countIntermission_Leave += 1;
					} else if (status_id.equals("5")) {
						countGraduate += 1;
					}

				}

			}

			StudentChart chart = new StudentChart();
			chart.countPass = countPass;
			chart.countProbation = countProbation;
			chart.countRetire = countRetire;
			chart.countResign = countResign;
			chart.countIntermission_Leave = countIntermission_Leave;
			chart.countGraduate = countGraduate;
			
			System.out.println("countPass : " + countPass);
		    System.out.println("countProbation : " + countProbation);
		    System.out.println("countRetire : " + countRetire);
		    System.out.println("countResign : " + countResign);
		    System.out.println("countIntermission_Leave : " + countIntermission_Leave);
		    System.out.println("countGraduate : " + countGraduate);
			
			return chart;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
}
