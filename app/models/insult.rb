class Insult
  attr_reader :insult, :play

  def initialize(insult, play)
    @insult = insult
    @play = play
  end

  def self.count
    result = db_connection { |conn| conn.exec("SELECT COUNT(*) FROM insults;") }
    result[0]['count'].to_i
  end

  def self.random_insult_id
    rand(1..Insult.count)
  end

  def self.find(id)
    result = db_connection do |conn|
      conn.exec_params("SELECT insult, play FROM insults WHERE id = $1", [id])
    end
    Insult.new(result[0]['insult'], result[0]['play'])
  end

end
