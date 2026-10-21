class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.155738.b97ac91"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155738-b97ac91/marvel-darwin-arm64"
    sha256 "c2fe1cfd8e01d5d8da515cc5ba647c97f8a1e8ca579087484cb056933b29ada4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155738-b97ac91/marvel-darwin-amd64"
    sha256 "b43423ca243f327792fca17eb343fa49609e076fc3e38f6ef6b8098cf1d534c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155738-b97ac91/marvel-linux-arm64"
    sha256 "ed26a2e356fd2173954798d2ffcbdd7ad0fe57ea61bb16b44222a9736ad95ab2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-155738-b97ac91/marvel-linux-amd64"
    sha256 "1ecad8116621c82968744e615dbb65e6c19fb61d5d2e563ba82c8ab8e6bc161a"
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
