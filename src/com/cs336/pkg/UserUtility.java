package src.com.cs336.pkg;
import java.time.Period;
import java.time.LocalDate;

public class UserUtility {
	private static int CHILD_AGE = 12;
	private static int SENIOR_AGE = 60;
	
	/**
	 * Calculates the user's age based on a formatted date.
	 * @param formattedDate A date in the format YYYY-MM-DD
	 * @return The user's age
	 */
	public static int userAge(String formattedDate) {
		// Holds the year, month, and day in that order
		int[] dateNums = new int[3];
		// loop counter
		int i = 0;
		// goes through each part of the string and converts it into an int
		for (String x : formattedDate.split("-")) {
			dateNums[i] = Integer.parseInt(x);
			i++;
		}
		// get local date for the user date of birth
		LocalDate userDOB = LocalDate.of(dateNums[0], dateNums[1], dateNums[2]);
		// get current local date
		LocalDate today = LocalDate.now();
		
		return Period.between(userDOB, today).getYears();
	}
	
	/**
	 * Calculates a discount based on the user's age.
	 * @param age The user's age
	 * @return A discount based the user's age
	 */
	public static double discount(int age) {
		// 25% discount for children
		if(age <= CHILD_AGE) {
			return 0.25;
		// 35% discount for senior citizens
		} else if(age >= SENIOR_AGE) {
			return 0.35;
		// no discount for "adults"
		} else {
			return 0;
		}
	}
}
