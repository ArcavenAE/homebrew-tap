class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.023130.d73c6b5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-023130-d73c6b5/marvel-darwin-arm64"
    sha256 "4f95c4e0c4b1e4022cd20d50f6a9c40b09587aa221351811c29be0b09a2a44c6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-023130-d73c6b5/marvel-darwin-amd64"
    sha256 "2a55d0a338410cb7aadd66d1832db82ee4363a85e9fb05c17e79a86ff39f00c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-023130-d73c6b5/marvel-linux-arm64"
    sha256 "7a56cd99d9a172894a5c75c443d0cac41a1a4de6fd605b776722e0101e04e8e7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-023130-d73c6b5/marvel-linux-amd64"
    sha256 "c78aec32682a4b2f3137cee508d43c08ee76ab842fe101022c06e08084b9380a"
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
