class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.151831.3f8828a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-151831-3f8828a/marvel-darwin-arm64"
    sha256 "f7685be50b18930ed346ca2aa89a32a7963fa55f5b14e48fc34780107be4bd5d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-151831-3f8828a/marvel-darwin-amd64"
    sha256 "d5d1fc2b473eadafa2c66234c85103fddc568e319ac39d79cef7ff64e4c58f0e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-151831-3f8828a/marvel-linux-arm64"
    sha256 "9157fef9e7fe53cf3b96c2edbf43589ace3e2a627d5468b1595544e15029d9e1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-151831-3f8828a/marvel-linux-amd64"
    sha256 "4172d5c6c47964bdd52944d5bb9fb91581c0417329b626bc0a6876c8da3fd625"
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
