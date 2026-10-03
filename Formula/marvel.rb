class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.111141.7487b05"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111141-7487b05/marvel-darwin-arm64"
    sha256 "6d7b72a07d42b7ecd902f5c64bb021233ad466ee9a015b3210c0805398705dd9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111141-7487b05/marvel-darwin-amd64"
    sha256 "3637760f8decc6f7532489b2466738afccedbb4787481808f8e8dcabea96df37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111141-7487b05/marvel-linux-arm64"
    sha256 "0f5419721194fc8bdd8865cf726b8b9ed11867425e2e7d37d1dfea405a814cf7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111141-7487b05/marvel-linux-amd64"
    sha256 "34a835b577eef6a42deab3cb7d1f609acdfea02a4e23d9968bb235440027a7cb"
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
