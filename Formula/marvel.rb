class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.195015.c3d25cf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-195015-c3d25cf/marvel-darwin-arm64"
    sha256 "df4d3b5bf7c17227687d6811b2d0349027ff05e59663690f3f20f6018676c4d8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-195015-c3d25cf/marvel-darwin-amd64"
    sha256 "9a2bc4781fbf548082aba4b7f4c5390caf50ec88a6669ebf6e967a2cfe3df55d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-195015-c3d25cf/marvel-linux-arm64"
    sha256 "f1c86f4135ea4ecc9d580d1ad063ebdeaa23020087471dccc315038984b7a148"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-195015-c3d25cf/marvel-linux-amd64"
    sha256 "2f8747ff03af9f22eb7961cee45ba91ea6aae3419e6a20c4dc6c56be71e35aef"
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
