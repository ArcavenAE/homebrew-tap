class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.193621.1ece92c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-193621-1ece92c/marvel-darwin-arm64"
    sha256 "73904678bb3d2d9567b44c814c727671c6de5ae6de5b4bed5156add03d8b497a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-193621-1ece92c/marvel-darwin-amd64"
    sha256 "7174d8b370c7cad12c128c121c262979b816ecf1715a278e166d1371c99bf390"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-193621-1ece92c/marvel-linux-arm64"
    sha256 "741c817471248dbc24ed0c0e6e803f0bb120333b725b83a9aeb3520e5a8bc71e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-193621-1ece92c/marvel-linux-amd64"
    sha256 "d354a248f4044a91221385ac0aa7deef2090aaf27ffc3b226928ab4573c6f4d8"
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
