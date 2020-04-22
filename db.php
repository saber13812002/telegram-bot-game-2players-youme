<?php
class DB {
	private $connection;
	private $result;
	
	function query($query) {
		$this->connection = @mysqli_connect ( "localhost", "user", "pass", "db" );
		if (! mysqli_connect_error ()) {
			@mysqli_query($this->connection, "SET NAMES 'utf8'");
			$this->result = mysqli_query ( $this->connection, $query );
			mysqli_close ( $this->connection );
		}
	}
	
	function get_result() {
		return $this->result;
	}
	
	function get_num_rows() {
		return mysqli_num_rows ( $this->result );
		//	return "sad";
	}
	
	function get_content_rows() {
		return mysqli_fetch_assoc ( $this->result );
	}
}
?>