package src.com.cs336.pkg;
import java.sql.*;

public class CustomerSupportHandler {
	private ApplicationDB db; // holds database
	private Connection conn; // holds database connection
	
	/**
	 * Constructor.
	 */
	public CustomerSupportHandler() {
		db = new ApplicationDB();
		conn = db.getConnection();
	}
	
	/**
	 * Fetches all questions and answers from the database.
	 * @return A ResultSet of every QA entry
	 * @throws SQLException
	 */
	public ResultSet getQuestions() throws SQLException {
		// holds questions
		ResultSet questions = null;
		// new statement
		Statement st = conn.createStatement();
		// select all tuples from QA
		questions = st.executeQuery("select * from QA;");
		return questions;
	}
	
	/**
	 * Inserts a new question into the database.
	 * @param username The user's username
	 * @param q The question to be inserted
	 * @throws SQLException
	 */
	public void askNewQuestion(String username, String q) throws SQLException {
		// prepared insert query
		PreparedStatement st = conn.prepareStatement("insert into QA (question, username) values (?, ?)");
		st.setString(1, q);
		st.setString(2, username);
		// execute query
		st.executeUpdate();
	}
}
