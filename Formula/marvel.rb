class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261028.025330.e52efb1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-025330-e52efb1/marvel-darwin-arm64"
    sha256 "60c076989bb8be4e1c333e44c70f79dc542cfc5f88a6ecc797ce7c30d0ab102d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-025330-e52efb1/marvel-darwin-amd64"
    sha256 "58a358a6e1c89555c6a2cb524914e84f85c10590030c12bc84c10589748ca060"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-025330-e52efb1/marvel-linux-arm64"
    sha256 "3d3d6ca4ae0f99804f78bb9191bfbd3e635db5e3a6326c2bc72de48dcbffef5f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-025330-e52efb1/marvel-linux-amd64"
    sha256 "f725200253d63598ad69fd1a408e20b32e5ac130bce11cba5989ece72a158316"
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
