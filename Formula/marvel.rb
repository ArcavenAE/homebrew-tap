class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.121020.efd25fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121020-efd25fe/marvel-darwin-arm64"
    sha256 "d42b634382235db592b897a9a4247d4586aab144709806301f70c79bc5091559"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121020-efd25fe/marvel-darwin-amd64"
    sha256 "a3fd0edddcc5e59593ffbf1ae5c2225a346f39b6be3bb904d7436ee21a761b78"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121020-efd25fe/marvel-linux-arm64"
    sha256 "14aa4f6ca24cfc34ea139536182708b226a6ff228815d0da9bcc0dcc0e2de23a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-121020-efd25fe/marvel-linux-amd64"
    sha256 "50ea953b820da74b493decd8564349947d2fdb16ef90caffdc878747a3632bb3"
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
