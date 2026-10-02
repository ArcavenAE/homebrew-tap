class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.222811.b760192"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222811-b760192/marvel-darwin-arm64"
    sha256 "f7705b10c561d0a880a03ae8cb848918beaf2522251c7b398a1ead57c1241c12"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222811-b760192/marvel-darwin-amd64"
    sha256 "9986ab22b9527e29d59a5c16544792a6956a99cdcf6e13bb51a43b867a1c595d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222811-b760192/marvel-linux-arm64"
    sha256 "b69e4f6794cf8e4ffca31360bede5c20745f99c7517303b618248f68c3e5a8dd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-222811-b760192/marvel-linux-amd64"
    sha256 "e34aebf68e29fee9c905adc22d1a938c9a64f30d7298972361abbbf6decfc6df"
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
