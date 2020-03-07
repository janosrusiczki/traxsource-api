module TitleAssertions
  it 'creates an instance' do
    _(@tp).must_be_instance_of TraxsourceParser::Title
  end

  it 'should have a title' do
    _(@title[:title]).wont_be_empty
  end

  it 'should have a full_title' do
    _(@title[:full_title]).wont_be_empty
  end

  it 'should have at least one artist' do
    _(@title[:artists].length).must_be :>=, 1
  end

  it 'should have some tracks' do
    _(@title[:tracks].length).must_be :>, 0
  end
end
