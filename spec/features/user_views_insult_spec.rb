require "spec_helper"
feature "user views insult page" do

  scenario "user visits homepage and sees first insult" do
    allow(Insult).to receive(:rand) {13}

      visit '/'

      expect(page).to have_current_path('/shakespeare/insults')
      expect(page).to have_content('You are not worth another word')
      expect(page).to have_css("a[href='/shakespeare/insults/13']")
      expect(page).to have_content('Get insult')
  end

  scenario "user clicks on get insult link and views new insult" do
    allow(Insult).to receive(:rand) {13}

      visit "/shakespeare/insults"

      click_link('Get insult')


      expect(page).to have_current_path('/shakespeare/insults/13')
      expect(page).to have_content('Away! Thou\'rt poison to my blood.')
      expect(page).to have_css("a[href='/shakespeare/insults/13']")
      expect(page).to have_content('Get insult')
  end
end
