require 'spec_helper'

feature 'Books exposure' do
  it 'renders books collection' do
    visit '/books'

    expect(page).to have_content('The Fellowship of the Ring')
    expect(page).to have_content('The Two Towers')
    expect(page).to have_content('The Return of the King')
  end

  it 'renders selected book title' do
    visit '/books/1'
    expect(page).to have_content('The Two Towers')
  end
end