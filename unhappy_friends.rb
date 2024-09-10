def unhappy_friends(n, preferences, pairs)
  # build the preference ranking hash
  preference_rankings = preferences.map do |prefs|
    prefs.each_with_index.to_h { |friend, rank| [friend, rank] }
  end

  # create a dictionary to store each person's paired friend
  paired_friends = {}
  pairs.each do |(x,y)|
    paired_friends[x] = y
    paired_friends[y] = x
  end

  # initialize an unhappy count
  unhappy_count = 0

  # check if there exists a person `u` who is a better preference for `x`
  # than 'x's paired friend `y`. We do this by checking the preference
  # rankings in the subset of preferences before `y`
  fx = 0
  while fx < n 
    fy = paired_friends[fx] #partner of the current friend
    is_unhappy = preferences[fx][0...preference_rankings[fx][fy]].any? do |u|
      preference_rankings[u][fx] < preference_rankings[u][paired_friends[u]]
    end    
    
    # increment the unhappy count if fx is found to be unhappy
    if is_unhappy
      unhappy_count += 1
    end
    
    fx += 1
  end

  return unhappy_count

end