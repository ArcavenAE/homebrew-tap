class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.200813.bfccaca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-200813-bfccaca/marvel-darwin-arm64"
    sha256 "b673e32bdae680e706ee893eddc951970eb6fca958cf6937082206708896b29f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-200813-bfccaca/marvel-darwin-amd64"
    sha256 "6017301c8ee74549477e15467033dd0581e3451d45297691bb6cc88b755c1480"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-200813-bfccaca/marvel-linux-arm64"
    sha256 "22d41487d8b80a71cbb54de3f7eaf3e9abe7f13709ef6b2e09ce5e95216e3296"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-200813-bfccaca/marvel-linux-amd64"
    sha256 "f85d2f08aaad3f05bdd9ad06723a2e3d90c68c29ccc554b5af620f2e86b1dc1f"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
