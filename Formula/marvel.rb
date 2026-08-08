class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.010506.9a289ea"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-010506-9a289ea/marvel-darwin-arm64"
    sha256 "d5ce523b5f5ca6e8fd603ae267f1afffd73123c853c13bd148c42d1f494f37b0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-010506-9a289ea/marvel-darwin-amd64"
    sha256 "44279f5afdde0da305839601f54997faee382c6f4803611a661ecd0ddab3c74b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-010506-9a289ea/marvel-linux-arm64"
    sha256 "250f1ff4345b592d37fe134f582577bbb13f8971ce8d819183f1e13917902dab"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-010506-9a289ea/marvel-linux-amd64"
    sha256 "1bb2d39c4b6794fded4b551ca86e1eae1e5d0e14cb5997cea6d7a96845ef74b0"
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
