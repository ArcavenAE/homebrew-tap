class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.191724.2f3f080"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191724-2f3f080/marvel-darwin-arm64"
    sha256 "19b2c49c6141f39c5f675cbd6e4f7cb8217908e7db556ffd4b63bd4b88f21bfe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191724-2f3f080/marvel-darwin-amd64"
    sha256 "e245a6d0e23e023430a69c724bd03717697650a635c53bb38ded5c755fcab18e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191724-2f3f080/marvel-linux-arm64"
    sha256 "0319f7d817efa8bcdde6f18525e0f1a416ad70439b7f9fa1de8b455332e8706c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191724-2f3f080/marvel-linux-amd64"
    sha256 "5b58d96fa5659b7a20990dfa520c87ed3e8e38c9afde245550d79ec31a4c05c6"
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
