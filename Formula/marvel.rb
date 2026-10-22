class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.191613.01f0806"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191613-01f0806/marvel-darwin-arm64"
    sha256 "8b0cb8ecbb532cffe44f9ec8022ac7f12f3c5f5aebd17ee88221ac565617122a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191613-01f0806/marvel-darwin-amd64"
    sha256 "ad0897516982a60e28e9f62bcf5a721fd418ad2e0751c7bb3a179debc8af97c4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191613-01f0806/marvel-linux-arm64"
    sha256 "3b57b3958e4acaf43216a6a0bf040fa9223a85bf0be56a1a6eac57c8ee11020b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191613-01f0806/marvel-linux-amd64"
    sha256 "520aafe13a520f1ce69032c61af3f561d51e60732703ec6d0293955657682f43"
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
