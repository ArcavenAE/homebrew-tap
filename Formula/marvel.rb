class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.202047.6411051"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-202047-6411051/marvel-darwin-arm64"
    sha256 "549bc475fd23089374a189441d1b0aec7aa9faf6b94965616a3baeac7d58e63e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-202047-6411051/marvel-darwin-amd64"
    sha256 "224f6ca33bba038e4777b1305f8f2f560080ed825213f499fe3363565755450d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-202047-6411051/marvel-linux-arm64"
    sha256 "c9eb24856b12f6aa0cfd5cae51efc0f02550b9c924a9246a573428d7672d2459"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-202047-6411051/marvel-linux-amd64"
    sha256 "8c2cd8c7f9e467b4fa52eb254115cd8843dd16508aa63f80e9f504d6a9a20e28"
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
