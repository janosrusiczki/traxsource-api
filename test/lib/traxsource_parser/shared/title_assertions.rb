module TitleAssertions
  it 'creates an instance' do
    @tp.must_be_instance_of TraxsourceParser::Title
  end

  it 'should have a title' do
    @title[:title].wont_be_empty
  end

  it 'should have a full_title' do
    @title[:full_title].wont_be_empty
  end

  it 'should have at least one artist' do
    @title[:artists].length.must_be :>=, 1
  end

  it 'should have some tracks' do
    @title[:tracks].length.must_be :>, 0
  end
end
