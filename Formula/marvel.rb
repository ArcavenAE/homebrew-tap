class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.043540.f437fb4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043540-f437fb4/marvel-darwin-arm64"
    sha256 "e1785abab3df89280bbe91a85df0d71cabe593539eb3f2e692f952228e960dbf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043540-f437fb4/marvel-darwin-amd64"
    sha256 "ea46acde9e98a008606371105715719739171e2fd987892e5a56257c0102dac1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043540-f437fb4/marvel-linux-arm64"
    sha256 "0a45f034cbf9c077f4d54977dee015c3ce22a0b83279172cf402029f3b8f7067"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043540-f437fb4/marvel-linux-amd64"
    sha256 "5f8391209f3de5b69c35ae396b652da222d2c13154495640d780b04867b76403"
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
