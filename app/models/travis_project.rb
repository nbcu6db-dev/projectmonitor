class TravisProject < Project

  attr_accessible :travis_github_account, :travis_repository
  validates :travis_github_account, :travis_repository, :presence => true

  def feed_url
    "http://travis-ci.org/#{travis_github_account}/#{travis_repository}/builds.json"
  end

  def build_status_url
    feed_url
  end

  def project_name
    travis_github_account
  end

  def payload
    TravisPayload
  end

  def payload_fetch_format
    :json
  end
end
