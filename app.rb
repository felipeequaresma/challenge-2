# frozen_string_literal: true

class App
  def smallest_temperature
    data = load_data('data/w_data.dat')

    temperature_variation = (6..36).map do |i|
      { day: data[i][0], variation: data[i][1].to_i - data[i][2].to_i }
    end

    puts temperature_variation.min_by { |h| h[:variation] }[:day]

    # expected answer: 14 with 2 varation
  end

  def smallest_score
    data = load_data('data/soccer.dat')
    data.delete_at(20)

    team_goal_variation = (3..22).map do |i|
      { team: data[i][1], variation: data[i][6].to_i - data[i][8].to_i }
    end

    puts team_goal_variation.min_by { |team| team[:variation].abs }[:team]

    # expected answer: Aston Villa with -1 variation
  end

  private

  def load_data(path)
    data = File.read(path)
    data.lines.map(&:split)
  end
end

app = App.new
app.smallest_temperature
app.smallest_score
