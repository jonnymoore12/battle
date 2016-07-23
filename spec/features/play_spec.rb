feature 'Play' do
	scenario "shows that it is player 1's turn at start" do
		sign_in_and_play
		expect(page).to have_content "Sam's turn!"
	end

	scenario "displays 3 'Attack!' buttons on player 1's turn" do
		sign_in_and_play
		expect(page).to have_button "Attack!"
		expect(page).to have_button "Attack 2!"
		expect(page).to have_button "Attack 3!"
	end

	before do
		sign_in_and_play
		click_button("Attack!")
    click_button("Resume combat!")
	end

	scenario "shows that it is player 2's turn after player 1 has attacked" do
		expect(page).to have_content "Jonny's turn!"
	end

	scenario "displays 'Continue' button on player 2's turn" do
    expect(page).to have_button "Continue"
	end
end
