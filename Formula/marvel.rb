class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.053511.d795273"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053511-d795273/marvel-darwin-arm64"
    sha256 "9b1293fe3c90c386f4efa7134eac79a4b27d1fd8f8c842e9b08e31a84d6f5cd0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053511-d795273/marvel-darwin-amd64"
    sha256 "f06e10f2edd361c6434ae425586a7a2febd98e729d7bcb591c5919e3aa868b69"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053511-d795273/marvel-linux-arm64"
    sha256 "49a7c78c4d8a0f305181056aecfcaf96bd84a1cd6d2bda093215a2b05ac8de76"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-053511-d795273/marvel-linux-amd64"
    sha256 "09f175ccefd5b2568ebd78fc0659fd0d7828c13a0709e2d3636437c957d26f77"
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
