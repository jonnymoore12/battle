def sign_in_and_play
  visit '/'
  fill_in "player_1", with: "Richard"
  fill_in "player_2", with: "Jonny"
  click_button "Confirm"
end
