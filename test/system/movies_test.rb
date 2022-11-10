require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  setup do
    @movie = movies(:one)
  end

  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "Movies"
  end

  test "should create movie" do
    visit movies_url
    click_on "New movie"

    fill_in "Main actor", with: @movie.Main_actor
    fill_in "Name", with: @movie.Name
    fill_in "Release year", with: @movie.Release_year
    fill_in "Genre", with: @movie.genre
    fill_in "String", with: @movie.string
    click_on "Create Movie"

    assert_text "Movie was successfully created"
    click_on "Back"
  end

  test "should update Movie" do
    visit movie_url(@movie)
    click_on "Edit this movie", match: :first

    fill_in "Main actor", with: @movie.Main_actor
    fill_in "Name", with: @movie.Name
    fill_in "Release year", with: @movie.Release_year
    fill_in "Genre", with: @movie.genre
    fill_in "String", with: @movie.string
    click_on "Update Movie"

    assert_text "Movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Movie" do
    visit movie_url(@movie)
    click_on "Destroy this movie", match: :first

    assert_text "Movie was successfully destroyed"
  end
end
