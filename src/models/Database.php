<?php
mysqli_report(MYSQLI_REPORT_STRICT);

/**
* DB CLASS
*/
class Db{

	private static $conn;

	public static function connect() {
		try {
			self::$conn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
			self::$conn->set_charset("utf8");
			return self::$conn;
		} catch (mysqli_sql_exception $e) {
			error_log($e->getMessage());
			die;
		}
	}

	public static function disconnect() {
		try {
			mysqli_close(self::$conn);
		} catch (Exception $e) {
			error_log($e->getMessage());
			die;
		}
	}

	/**
	*	$select = array(); coluns of table
	*	$table = name of table db
	*   $innerjoins = array(); tables
	*   $where_field =
	*	  $where_value =
	*	  $order_by =
	* 	$order_by_type = 'ASC' || 'DESC'
	*/
  public static function select($select = null,  $table = null, $inner_joins = null, $where_field = null, $where_value = null, $order_by = null,  $order_by_type = 'ASC', $group_by = null, $limit = null){
		try {
	    $database = self::connect();

			$where_value = $database->real_escape_string($where_value);

 			if(isset($table)){
				if(isset($select)){
					$fields = null;
					foreach ($select as $field) {
						$fields .= trim($field, "'") . ", ";
					}
					$fields = substr($fields, 0, strlen($fields) - 2);
					$sql = "SELECT " . $fields . " FROM " . $table;
				}else{
					$sql = "SELECT * FROM " . $table;
				}

				if(isset($inner_joins)){
					$fields = null;
					foreach ($inner_joins as $tables => $value) {
					  $sql .= " INNER JOIN " . trim($tables, "'") . " ON " . $value;
					}
				}

      	if(isset($where_field) &&  isset($where_value)){
        	$sql .= " WHERE " . $where_field . ' = \'' . $where_value . '\'';
      	}

      	if(isset($group_by)){
      		$sql .= " GROUP BY " . $group_by;
      	}

      	if(isset($order_by)){
       	 	$sql .= " ORDER BY " . $order_by . " " . $order_by_type;
      	}

      	if(isset($limit)){
       	 	$sql .= " LIMIT " . $limit;
      	}

      	$sql .= ';';

      	// if(DEBUG){
				// 	error_log($sql);
		    // }

		    if (!($result = $database->query($sql))) {
					throw new Exception($database->error);
				}

	    	$found = NULL;

		    if(isset($where_field) && isset($where_value)){
		    	if ($result->num_rows > 0) {
		       	$found = $result->fetch_assoc();
		   		}
		   	}else{
		   		$found = $result->fetch_all(MYSQLI_ASSOC);
		   	}

				self::disconnect();

		   	return $found;

			}else{
				throw new Exception('Nenhuma tabela foi definida.');
			}
		} catch (Exception $e){
			if(DEBUG) :
	    	error_log('danger', 0);
	    	error_log($sql, 0);
	    	error_log($e->GetMessage(), 0);
	  	endif;
	  	return NULL;
		}
	}

	public static function count( $table = null, $field = null  , $as = null) {
		self::connect();
		$found = null;
		try {
		   	$sql = "SELECT COUNT(" . $field .  ") ";

		   	if($as != NULL){
		   	 	$sql .= " AS " . $as;
		   	}

		   	$sql .=  " FROM `". $table . "`";

		   	$result = $database->query($sql);

		    if ($result->num_rows > -1) {
	       		$found = $result->fetch_assoc();

	       		$found = ($as != NULL) ? $found[$as] : $found['COUNT('. $field .')'];
	   		}

		} catch (Exception $e) {
			if(DEBUG) :
	    	error_log('danger', 0);
	    	error_log($sql, 0);
	    	error_log($e->GetMessage(), 0);
	  	endif;
		  $_SESSION['message'] = $e->GetMessage();
		  $_SESSION['type'] = 'danger';
	  }

		self::disconnect();
		return $found;
	}

	/**
	*  Insere um registro no BD
	*/
	public static function insert($table = null, $data = null) {
	  $database = self::connect();
	  $columns = null;
	  $values = null;

	  foreach ($data as $key => $value) {
	    $key = trim($key, "'") . ",";
	  	$columns .= $database->real_escape_string($key);
	  	$value = $database->real_escape_string($value);
	    $values .= "'$value',";
	  }

	  // remove a ultima virgula
	  $columns = rtrim($columns, ',');
	  $values = rtrim($values, ',');

	  $sql = "INSERT INTO " . $table . "($columns)" . " VALUES " . "($values);";
	  try {
	    if (!($result = $database->query($sql))) {
    		throw new Exception($database->error);
			}else{
				$last_id = $database->insert_id;
			}
	  } catch (Exception $e) {
	    if(DEBUG) :
	    	error_log('danger', 0);
	    	error_log($sql, 0);
	    	error_log($e->GetMessage(), 0);
	  	endif;
	    $_SESSION['message'] = $e->GetMessage();
			$_SESSION['type'] = 'danger';
	  }

	  self::disconnect();
	  return (isset($last_id)) ? $last_id : NULL;
	}


	/**
	 *  Atualiza um registro em uma tabela, por ID
	 */
	public static function update($table = null, $field = null, $id = null, $data = null) {
	  $database = self::connect();
	  $items = null;

	  $id = $database->real_escape_string($id);

	  foreach ($data as $key => $value) {
	  	$key = $database->real_escape_string(trim($key, "'"));
	  	$value = $database->real_escape_string($value);
	    $items .= $key . "='$value',";
	  }
	  // remove a ultima virgula
	  $items = rtrim($items, ',');

	  $sql  = "UPDATE " . $table;
	  $sql .= " SET $items";
	  $sql .= " WHERE ". $field . " = " . $id . ";";
	  try {
			$result = $database->query($sql);
	  	if ($result) {
			  self::disconnect();
				return $result;
			}else{
    		throw new Exception($database->error);
	    }
	  } catch (Exception $e) {
	    if(DEBUG) :
	    	error_log('type = error', 0);
	    	error_log($sql);
	    	error_log($e->GetMessage(), 0);
	    endif;
	  }

	  self::disconnect();
	}

	/**
	 *  Remove uma linha de uma tabela pelo ID do registro
	 */
	public static function delete( $table = null, $field = null, $id = null ) {
	  $database = self::connect();

	  $id = $database->real_escape_string($id);

	  try {
	    if ($id) {
	      $sql = "DELETE FROM " . $table . " WHERE " . $field . " = '" . $id ."'";
	      $result = $database->query($sql);
	      if (!$database->query($sql)) {
	    		throw new Exception($database->error);
				}
	    } else {
				throw new Exception('ID não definido.');
			}
	  } catch (Exception $e) {
			if(DEBUG) :
				error_log('type = error', 0);
				error_log($sql);
				error_log($e->GetMessage(), 0);
			endif;
	  }
	  self::disconnect();
	}

	/**
	 *	Get all data on the table
	 **/
	public static function getAllTable($table) {
		return self::select(NULL, $table, NULL, NULL, NULL, NULL);
	}

	public static function getLastId($table){
		$index = self::select(NULL, $table, NULL, NULL, NULL, 'id', 'DESC', NULL, '1');
		return $index[0];
	}
}
?>
