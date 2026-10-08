class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.134956.c81c82e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-134956-c81c82e/marvel-darwin-arm64"
    sha256 "cc6a0b626f90ce1137558cc1512f3cf502364e49447a7eb49ecf9c798929e661"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-134956-c81c82e/marvel-darwin-amd64"
    sha256 "e798d98872511a31ded2603166d227129938217cd80fcb8e3d6d8f3a1493a9fa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-134956-c81c82e/marvel-linux-arm64"
    sha256 "3cf434269ad15917cf0a95014eca6c4839c1468a65c53767e65376232ca3ad69"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-134956-c81c82e/marvel-linux-amd64"
    sha256 "ecf78ddd12fae0f42a71abaeb986476040cd5b3fc36f43b7a6cc8baf811df31b"
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
