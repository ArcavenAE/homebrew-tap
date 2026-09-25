class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.024343.8037d09"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024343-8037d09/marvel-darwin-arm64"
    sha256 "2d8922ecb05f784a40bdf213621979ca7caa6d954db88c0cb65c18fe9130cac8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024343-8037d09/marvel-darwin-amd64"
    sha256 "eba28a942bdd61e053b005f8c0ebea7bbc2f7e7be11d15ab849a888a1955c520"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024343-8037d09/marvel-linux-arm64"
    sha256 "def253dc2c4e7b12eb9a053f562761081b4b8344e72bf18e46dc268750a1230a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-024343-8037d09/marvel-linux-amd64"
    sha256 "a9ae8341c1083878d04dcc1571ac18cf654df12c08021587a82e64aee4ec8149"
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
