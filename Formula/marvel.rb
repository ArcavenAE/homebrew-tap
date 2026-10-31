class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.035433.fa22892"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-035433-fa22892/marvel-darwin-arm64"
    sha256 "88de5ceb4f615859719c17a0934301c14671c688333398663cc124847652e111"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-035433-fa22892/marvel-darwin-amd64"
    sha256 "52b9f6a7400cc80f0cad1b91148eedd9527385354791fa19d82d433459ef6c5d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-035433-fa22892/marvel-linux-arm64"
    sha256 "4f741673f3e1e154412f38d5f0dc44dec816fa467ac415f1a4c67a254d983416"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-035433-fa22892/marvel-linux-amd64"
    sha256 "21decbb42f3e3a1f468abd30d6bac3a7b48dbddb5ac0421a78e478539b06bdd1"
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
