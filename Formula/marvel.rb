class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.193559.5d22165"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193559-5d22165/marvel-darwin-arm64"
    sha256 "d417710ff786f3630a9ffb858ad66006c57c4e691649f5199cd2d1bae3bbf8d1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193559-5d22165/marvel-darwin-amd64"
    sha256 "ecf7b3844b8b74f53064e5acb515829cc5beafa65bde636bcf4892dffa5025ef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193559-5d22165/marvel-linux-arm64"
    sha256 "ca8463dcc264e7f8db31cfaea63ecffab365ae24a3ccc85e64a70b7a4c335f5c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-193559-5d22165/marvel-linux-amd64"
    sha256 "1b79da4034eb3aa8ba79f856dfeac0731c8964756cef571c368e228f58a5339e"
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
