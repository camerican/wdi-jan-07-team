class User

  def self.all
    sql_results_parser `sqlite3 test.db "SELECT * FROM users";`
  end

  def self.find x
    sql_results_parser(`sqlite3 test.db "SELECT * FROM users WHERE id = '#{x}';"`).first
  end

  def self.first 
    sql_results_parser(`sqlite3 test.db "SELECT * FROM users ORDER BY id ASC LIMIT 1;"`).first
  end

  def self.last 
    sql_results_parser(`sqlite3 test.db "SELECT * FROM users ORDER BY id DESC LIMIT 1;"`).first
  end

  def self.sql_results_parser(results)
    results.split("\n").map do |person|
      person.split('|')
    end
  end
  
end