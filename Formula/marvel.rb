class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.232731.1b03db3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-232731-1b03db3/marvel-darwin-arm64"
    sha256 "32dc2d25c56eb6b3d0dfdd836443a38c4d0d81c0b4f9d3cdced8527d1d6dafa6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-232731-1b03db3/marvel-darwin-amd64"
    sha256 "0a5fc7c68e326670c88b823e227df4d9b78a993ae3a91d39ed1cc690e83dd5dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-232731-1b03db3/marvel-linux-arm64"
    sha256 "66008c12b36a1eeb331863d155d7ab3cfbb4e73cb3834a0ebb54157e0310ad72"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-232731-1b03db3/marvel-linux-amd64"
    sha256 "2ca7ca948b16ad288b1bca974ce604d6806cda614a77dca60a132676cdc1c888"
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
