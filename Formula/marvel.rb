class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.175022.279fd0a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-175022-279fd0a/marvel-darwin-arm64"
    sha256 "61096e558eb94aaeb5b841b90e8028af0603e68fa36bc17cd16c7456fd6c1b5c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-175022-279fd0a/marvel-darwin-amd64"
    sha256 "e4539dcbc0b7869b58b7b6140df078c4c177bab131fc8ae3f421f4cac55bf152"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-175022-279fd0a/marvel-linux-arm64"
    sha256 "0d39d7f00d5aaaf4ac8625c1acd1faf0df4135c6a88640cc88020907cadeb414"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-175022-279fd0a/marvel-linux-amd64"
    sha256 "f16e380d4f2814944af49e19e342e44f9cd189fafc4b214ef8dc68e1e5bae7c2"
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
