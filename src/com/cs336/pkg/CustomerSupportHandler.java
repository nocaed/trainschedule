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
		questions = st.executeQuery("select question, answer, username from QA;");
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
	
	/**
	 * Gets all questions/answers from the database where the question includes a specified keyword.
	 * @param keyword The keyword that must be matched in the question
	 * @return All matching tuples that contain the keyword in the question
	 * @throws SQLException
	 */
	public ResultSet searchByKeyword(String keyword) throws SQLException {
		// holds questions
		ResultSet questions = null;
		// new statement
		Statement st = conn.createStatement();
		// select all tuples from QA where the question includes the keyword
		questions = st.executeQuery("select question, answer, username from QA where question like '%" + keyword + "%';");
		return questions;
	}
	
	/**
	 * Fetches all unanswered questions.
	 * @return All questions where there is no answer
	 * @throws SQLException
	 */
	public ResultSet allUnansweredQuestions() throws SQLException {
		ResultSet questions = null;
		Statement st = conn.createStatement();
		questions = st.executeQuery("select question, answer, username from QA where answer is null");
		return questions;
	}
	
	/**
	 * Updates a question to be answered.
	 * @param q The question to update
	 * @param a The answer to the question
	 * @param ssn The SSN of the employee who answered the question
	 * @throws SQLException
	 */
	public void answerQuestion(String q, String a, String ssn) throws SQLException {
		// prepare query
		PreparedStatement st = conn.prepareStatement("update QA set answer = ?, ssn = ? where question = ?");
		// Insert values
		st.setString(1, a);
		st.setString(2, ssn);
		st.setString(3, q);
		// Execute query
		st.executeUpdate();
	}
}
