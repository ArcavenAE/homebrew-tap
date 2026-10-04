class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.053335.68f83dc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053335-68f83dc/marvel-darwin-arm64"
    sha256 "4b53cda582e1c0c5d5504de014011c27e230396ccde0a53efec47c75730f4640"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053335-68f83dc/marvel-darwin-amd64"
    sha256 "e293c3e26464bf2f01f5f4dd44cb8700dd04b817f6e0f7c4b80accd4f4495a10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053335-68f83dc/marvel-linux-arm64"
    sha256 "e9d69d5dd1ae0f59ec9b87b2aa1d3008a6b86b94641ce902d6a63cae558ee4c0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-053335-68f83dc/marvel-linux-amd64"
    sha256 "64487557de21da0ca2a3787201a3935702400b823aad633adcaf782663581a3d"
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
