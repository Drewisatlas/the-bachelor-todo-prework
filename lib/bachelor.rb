require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |year, contestants|
    if season == year
      contestants.each do |attribute|
        attribute.value?("Winner")
        return attribute["name"].split.first
      end
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |year, contestants|
      contestants.each do |attribute|
        if attribute.has_value?(occupation)
        return attribute["name"]
        end
      end
  end
end

def count_contestants_by_hometown(data, hometown)
  hometown_hash = []
  data.each do |year, contestants|
      contestants.each do |attribute|
        if attribute.has_value?(hometown)
          hometown_hash << attribute["name"]
        end
      end
  end
  hometown_hash.count
end

def get_occupation(data, hometown)
  data.each do |year, contestants|
      contestants.each do |attribute|
        if attribute.has_value?(hometown)
          return attribute["occupation"]
        end
      end
  end
end

def get_average_age_for_season(data, season)
  age_total = 0
  counter = 0.0
  data.each do |year, contestants|
    if season == year
      contestants.each do |attribute|
        age_total = attribute["age"].to_i + age_total
        counter += 1.0
      end
    end
  end
  (age_total/counter).round
end
