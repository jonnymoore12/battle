feature 'Hit points' do
  scenario "we can see player 1 and 2's hit points" do
    sign_in_and_play
    expect(page).to have_content "Jonny HP:100" && "Sam HP:100"
  end

  scenario "when a player reaches 0hp, GAME OVER is confirmed" do
  	sign_in_and_play
    choose("attack 3")
    click_button("Continue")
  	expect(page).to have_content "JONNY LOSES! GAME OVER!!"
  end

end
