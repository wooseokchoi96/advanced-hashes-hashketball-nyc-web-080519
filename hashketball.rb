require "pry"

def game_hash
  {
    home: { 
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: [
        "Alan Anderson" => 
          {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => 
          {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => 
          {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => 
          {number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => 
          {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: [
        "Jeff Adrien" => 
          {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismack Biyombo" => 
          {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => 
          {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => 
          {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Kemba Walker" => 
          {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(my_player_name)
  game_hash.each do |team_h_a, team_info| 
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_name == my_player_name 
          return player_info[:points]
        end
      end
    end
  end
end

def shoe_size(my_player_name)
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_name == my_player_name
          return player_info[:shoe]
        end
      end
    end
  end
end

def team_colors(my_team_name)
  game_hash.each do |team_h_a, team_info|
    if team_info[:team_name] == my_team_name
      return team_info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |team_h_a, team_info|
    teams.push(team_info[:team_name])
  end
  teams
end

def player_numbers(my_team_name)
  numbers = []
  game_hash.each do |team_h_a, team_info|
    if team_info[:team_name] == my_team_name
      team_info[:players].each do |players|
        players.each do |player_name, player_info|
          numbers.push(player_info[:number])
        end
      end
    end
  end
  numbers
end

def player_stats(my_player_name)
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_name == my_player_name
          return player_info
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  biggest_rebound = 0
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_info[:shoe] > biggest_shoe
          biggest_shoe = player_info[:shoe]
          biggest_rebound = player_info[:rebounds]
        end
      end
    end
  end
  biggest_rebound
end

def most_points_scored
  most_points = 0
  highest_scorer = ""
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_info[:points] > most_points
          most_points = player_info[:points]
          highest_scorer = player_name
        end
      end
    end
  end
  highest_scorer
end

def winning_team
  home_score = 0 
  away_score = 0 
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if team_h_a == :home 
          home_score += player_info[:points]
        else
          away_score += player_info[:points]
        end
      end
    end
  end
  if home_score > away_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_name.length > longest_name.length
          longest_name = player_name
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0 
  player_with_most_steals = ""
  game_hash.each do |team_h_a, team_info|
    team_info[:players].each do |players|
      players.each do |player_name, player_info|
        if player_info[:steals] > most_steals
          most_steals = player_info[:steals]
          player_with_most_steals = player_name
        end
      end
    end
  end
  player_with_most_steals == player_with_longest_name
end









